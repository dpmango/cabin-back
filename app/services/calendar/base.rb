require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/web_user_authorizer'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module Calendar
  class Base
    APPLICATION_NAME = 'Cabin Backend'.freeze
    CLIENT_SECRETS_PATH = 'app/services/calendar/client_secret.json'.freeze
    CREDENTIALS_PATH = 'app/services/calendar/token.yaml'.freeze
    SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

    def initialize(request)
      @request = request
      start
    end

    def service
      @service
    end

    def get_last_10
      # Fetch the next 10 events for the user
      calendar_id = 'primary'
      events = @service.list_events(calendar_id,
                                     max_results: 10,
                                     single_events: true,
                                     order_by: 'startTime',
                                     time_min: Time.now.iso8601)

      if events.items.empty?
        response = 'No upcoming events found' if events.items.empty?
      else
        filtered_items = []
        events.items.each do |event|
          data = {}
          data["name"] = event.summary
          data["date"] = event.start.date
          data["time"] = event.start.date_time
          filtered_items.push(data)
          # start = event.start.date || event.start.date_time
          # puts "- #{event.summary} (#{start})"
        end

        response = filtered_items
      end
    end

    def get_events_on_date(date)
      calendar_id = 'primary'
      time_min = Time.zone.parse(date).to_datetime.rfc3339
      time_max = Time.zone.parse(date).end_of_day.to_datetime.rfc3339
      events   = @service.list_events(calendar_id,
                                      single_events: true,
                                      order_by: 'startTime',
                                      time_min: time_min,
                                      time_max: time_max)
      events.items.map do |event|
        data = {}
        data['name'] = event.summary
        data[:start] = event.start.date_time.utc.strftime('%H:%M')
        data[:end]   = event.end.date_time.utc.strftime('%H:%M')
        data
      end
    end

    private

    def start
      puts "========== AUTHORIZATION =========="
      # Initialize the API
      calendar = Google::Apis::CalendarV3::CalendarService.new
      calendar.client_options.application_name = APPLICATION_NAME
      calendar.authorization = authorize

      @service = calendar
    end

    def authorize
      client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
      authorizer = Google::Auth::WebUserAuthorizer.new(client_id, SCOPE, token_store, '/oauth2callback')
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id, @request)
      if credentials.nil?
        raise StandardError, authorizer.get_authorization_url(login_hint: user_id, request: @request)
      end
      credentials
    end
  end
end


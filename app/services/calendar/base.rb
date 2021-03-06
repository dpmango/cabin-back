
require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/web_user_authorizer'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module Calendar
  class Base
    SCOPES = [Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY]
    ACTIVE_STATUSES = %w(confirmed tentative)

    def initialize
      # @calendars = ["khmelevskoysergey@gmail.com", "cu9bavc8vubc33qva5tqi2gh58@group.calendar.google.com"]
      @calendars = ["rifeng@cabin.com.sg", "rifeng@grain.com.sg", "rifeng.gao@gmail.com"]
      start
    end

    def service
      @service
    end

    def get_last_10
      # Fetch the next 10 events for the user
      result_events = []
      @calendars.each do |calendar_id|
        events = @service.list_events(calendar_id,
                                     max_results: 10,
                                     single_events: true,
                                     order_by: 'startTime',
                                     time_min: Time.now.utc.to_datetime.rfc3339)

        filtered_items = events.items.select{ |event| ACTIVE_STATUSES.include?(event.status) }
        filtered_items.each do |event|
          if event.start.date_time # select only date_time type of events
            data = {}
            data[:name] = event.summary
            data[:start] = event.start.date_time.utc
            data[:end] = event.end.date_time.utc
            result_events << data
          end
        end
      end
      result_events
    end

    def get_events_on_date(date)
      time_min = Time.zone.parse(date).to_datetime.rfc3339
      time_max = Time.zone.parse(date).end_of_day.to_datetime.rfc3339

      result_events = []
      @calendars.each do |calendar_id|
        events   = @service.list_events(calendar_id,
                                        single_events: true,
                                        order_by: 'startTime',
                                        time_min: time_min,
                                        time_max: time_max)
        filtered_items = events.items.select{ |event| ACTIVE_STATUSES.include?(event.status) }
        filtered_items.each do |event|
          if event.start.date_time # select only date_time type of events
            data = {}
            data[:name] = event.summary
            data[:start] = event.start.date_time.utc.strftime('%H:%M')
            data[:end]   = event.end.date_time.utc.strftime('%H:%M')
            result_events << data
          end
        end
      end
      result_events
    end

    private

    def start
      # Initialize the API
      calendar = Google::Apis::CalendarV3::CalendarService.new
      calendar.authorization = authorize
      #
      # For public calendars simple API Key authorization is enough
      #
      # calendar.key = 'YOUR-API-KEY'

      @service = calendar
    end

    def authorize
      authorization = Google::Auth.get_application_default(SCOPES)
      auth_client = authorization.dup
      auth_client.sub = 'cabin-timeslot-booking@mindful-carport-208503.iam.gserviceaccount.com' # replace it within email address
      auth_client.fetch_access_token!
      auth_client
    end
  end
end

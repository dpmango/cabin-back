require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

module Calendar
  puts "========== INIT GOOGLE CALENDAR SERVICE =========="
  class Base

    # attr_accessor :error_message, :response, :code, :body
    # attr_reader :resource

    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
    APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'.freeze
    CLIENT_SECRETS_PATH = 'app/services/calendar/client_secret.json'.freeze
    CREDENTIALS_PATH = 'app/services/calendar/token.yaml'.freeze
    SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

    def initialize
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


      # success?
    end

    def get_events_on_date

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
        authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
        user_id = 'default'
        credentials = authorizer.get_credentials(user_id)
        if credentials.nil?
          url = authorizer.get_authorization_url(base_url: OOB_URI)
          puts 'Open the following URL in the browser and enter the ' \
               'resulting code after authorization:\n' + url
          code = gets
          credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: OOB_URI
          )
        end
        credentials
      end

      ######
      # TODO
      ######

      def success_status_codes
        [200]
      end

      def success?
        return true if success_status_codes.include?(code)
        Rails.logger.error(error_message)
        false
      end

  end
end


# https://stackoverflow.com/questions/40722687/how-to-set-up-google-calendar-api-using-ruby-client-for-server-to-server-applica

#   def events(reload=false)
#     # NOTE: This is just for demonstration purposes and not complete.
#     # If you have more than 2500 results, you'll need to get more than
#     # one set of results.
#     @events = nil if reload
#     @events ||= service.list_events(calendar_id, max_results: 2500).items
#   end
#
# private
#
#   def calendar_id
#     @calendar_id ||= # The calendar ID you copied in step 20 above (or some reference to it).
#   end
#
#   def authorize
#     calendar = Google::Apis::CalendarV3::CalendarService.new
#     calendar.client_options.application_name = 'App Name' # This is optional
#     calendar.client_options.application_version = 'App Version' # This is optional
#
#     # An alternative to the following line is to set the ENV variable directly
#     # in the environment or use a gem that turns a YAML file into ENV variables
#     ENV['GOOGLE_APPLICATION_CREDENTIALS'] = "/path/to/your/google_api.json"
#     scopes = [Google::Apis::CalendarV3::AUTH_CALENDAR]
#     calendar.authorization = Google::Auth.get_application_default(scopes)
#
#     @service = calendar
#   end

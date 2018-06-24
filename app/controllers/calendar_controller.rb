class CalendarController < ApplicationController

  # GET /calendar
  def index
    # get last 10 events
    @res = Calendar::Base.new.get_last_10
    @result = @res

    # start = event.start.date || event.start.date_time
    # puts "- #{event.summary} (#{start})"

    render json: @res
  end

  # GET /calendar/:date
  def show
    # show events within sepcific date

  end

end

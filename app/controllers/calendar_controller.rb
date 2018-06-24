class CalendarController < ApplicationController

  # GET /calendar
  def index
    # get last 10 events
    @res = Calendar::Base.new(request).get_last_10
    render json: @res
  rescue Exception => e
    render json: { error: 'Not authorized', redirect_to: e.message }
    # redirect_to e.message
  end

  # GET /calendar/:date
  def show
    # show events within sepcific date
    @res = Calendar::Base.new(request).get_events_on_date(params[:date])
    render json: @res
  end

end

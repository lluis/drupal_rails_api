class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    if params[:id]
      @events = @events.where(id: params[:id])
    end

    if params[:from]
      @events = @events.where("date >= ?", params[:from])
    end

    if params[:to]
      @events = @events.where("date <= ?", params[:to])
    end

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit()
    end
end

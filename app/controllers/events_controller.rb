class EventsController < ApplicationController
  def update
    EventFacade.update_event(params[:trip_id], params[:id])
    redirect_to trip_path(params[:trip_id])
  end
end
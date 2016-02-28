class FooldalController < ApplicationController

	def index
		@events = Event.order(date: :desc).all
	end

	def event
		@event = Event.find(params[:id])
		redirect_to "http://www.facebook.com/" + @event.fb_id.to_s
	end
end

class FooldalController < ApplicationController

	def index
		@events = Event.paginate(page: params[:page], per_page: 15).order(date: :asc).where('date > ?', DateTime.now)
		if !params[:from].nil?
			@events = @events.where('date > ?', params[:from])
		end
		if !params[:to].nil?
			@events = @events.where('date < ?', params[:to])
		end
		@last_update = Setting.last_update
		@xhr = request.xhr?
		respond_to do |format|
  			format.html { render :layout => !request.xhr? } # your-action.html.erb
		end
	end

	def event
		@event = Event.find(params[:id])
		redirect_to "http://www.facebook.com/" + @event.fb_id.to_s
	end
end

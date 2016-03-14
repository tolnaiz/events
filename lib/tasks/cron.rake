namespace :cron do
  desc "Downloading facebook events"
  task event_download: :environment do
    puts "Starting: " + Time.now.to_s
    @graph = Koala::Facebook::API.new("***REMOVED***", '***REMOVED***')

    @pages = Page.all

    @pages.each do |page|
        begin
            puts "FB: " + page['link'] + "/events"
            @events = @graph.get_object(page['link'] + "/events")
            @events.each do |e|
                begin
                    @event_data = @graph.get_object(e["id"])
                    puts "FB: " + e["id"] + "/?fields=cover"
                    @photos = @graph.get_object(e["id"] + "/?fields=cover")
                    @event = Event.find_or_create_by(:fb_id => e['id'])
                    @event.title = e["name"]
                    if @photos.has_key?("cover")
                        @event.picture = @photos["cover"]["source"]
                    end
                    @event.location = e["location"]
                    @event.description = @event_data['description']
                    @event.json_data = ActiveSupport::JSON.encode(@event_data)
                    @event.date = e["start_time"]
                    @event.page_id = page['id']
                    @event.save
                rescue
                    e['fb_id'] + " error"
                end
            end

        rescue
            puts page['link'] + " error"
        end
    end
    Setting.last_update = Time.now
    puts "Finishing: " + Time.now.to_s
  end

end

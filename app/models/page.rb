class Page < ActiveRecord::Base
	validates :link, presence: true
end

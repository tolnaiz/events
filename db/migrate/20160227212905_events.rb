class Events < ActiveRecord::Migration
  def change
      create_table :events do |t|
          t.string :title
          t.string :picture
          t.string :location
          t.text   :json_data
          t.date   :date
          t.bigint :fb_id
          t.timestamps null: false
      end
  end
end

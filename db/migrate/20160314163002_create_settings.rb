class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings, :options => "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :key
      t.text :value
    end

    add_index :settings, :key, :unique => true
  end

  def self.down
    drop_table :settings
  end
end

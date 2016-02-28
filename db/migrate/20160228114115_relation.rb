class Relation < ActiveRecord::Migration
  def change
      add_reference :events, :page, index: true, foreign_key: true
  end
end

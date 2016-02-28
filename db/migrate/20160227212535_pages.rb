class Pages < ActiveRecord::Migration
  def change
      create_table :pages do |t|
          t.string :link, null: false
          t.string :name, null: false

          t.timestamps null: false
      end
  end
end

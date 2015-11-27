class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.datetime :date
      t.integer :host_id
    end
  end
end

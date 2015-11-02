class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :dish_id
      t.integer :dinner_id
    end
  end
end

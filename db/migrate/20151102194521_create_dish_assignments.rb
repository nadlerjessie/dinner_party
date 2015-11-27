class CreateDishAssignments < ActiveRecord::Migration
  def change
    create_table :dish_assignments do |t|
      t.integer :guest_id
      t.integer :menu_item_id
    end
  end
end

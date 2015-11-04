class AddColumnToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :recipe_title, :string
    add_column :menu_items, :recipe_url, :string
  end
end

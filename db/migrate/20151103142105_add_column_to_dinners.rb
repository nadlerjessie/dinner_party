class AddColumnToDinners < ActiveRecord::Migration
  def change
    add_column :dinners, :title, :string
  end
end

class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :dinner_id
      t.integer :guest_id
      t.string :status, default: "pending"
    end
  end
end

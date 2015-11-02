class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.integer :dinner_id
      t.integer :guest_id
      t.string :status
    end
  end
end

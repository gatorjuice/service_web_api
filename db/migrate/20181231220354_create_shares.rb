class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :resource_id
      t.string :message_sid
    end
  end
end

class CreateUsersMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :users_messages do |t|
      t.integer :users_id
      t.integer :message_id
      t.string :content

      t.timestamps
    end
  end
end

class CreateUsersRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :users_rounds do |t|
      t.references :user, index:true, foreign_key: true
      t.references :round, index:true, foreign_key: true
      t.integer :approval_flag, :default => 0

      t.timestamps
    end
  end
end

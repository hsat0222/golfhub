class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :map_id
      t.integer :prefecture_id
      t.string :round_title
      t.date :round_date
      t.string :round_intro
      t.integer :recruitment_sex
      t.integer :capacity

      t.timestamps
    end
  end
end

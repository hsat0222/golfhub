class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :pref_name
      t.string :pref_region

      t.timestamps
    end
  end
end

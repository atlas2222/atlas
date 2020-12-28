class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.text :asset
      t.text :stoploss
      t.text :target_1
      t.text :target_2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

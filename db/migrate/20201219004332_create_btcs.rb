class CreateBtcs < ActiveRecord::Migration[6.0]
  def change
    create_table :btcs do |t|
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end

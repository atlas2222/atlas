class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.boolean :deposit
      t.boolean :withdrawl
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

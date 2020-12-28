class AddStatusToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :pending, :boolean
  end
end

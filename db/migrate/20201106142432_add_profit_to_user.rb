class AddProfitToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profit, :integer, :default => 0
  end
end

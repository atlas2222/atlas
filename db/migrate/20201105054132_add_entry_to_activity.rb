class AddEntryToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :entry, :text
  end
end

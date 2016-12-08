class AddExportedFieldToOldIncome < ActiveRecord::Migration
  def change
    add_column :old_expenses, :exported, :boolean, default: false
  end
end

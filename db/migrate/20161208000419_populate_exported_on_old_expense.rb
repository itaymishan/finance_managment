class PopulateExportedOnOldExpense < ActiveRecord::Migration
  def change
    OldExpense.all.each{|old| old.update_columns(exported: true)}
  end
end

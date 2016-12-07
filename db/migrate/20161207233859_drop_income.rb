class DropIncome < ActiveRecord::Migration
  def change
    drop_table :incomes
  end
end

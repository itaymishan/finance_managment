class AddDateToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :date, :date
  end
end

class AddCurrencyToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :year, :integer, null: false
    add_column :incomes, :month, :integer, null: false
    add_reference :incomes, :currency, index: true, null: false
  end
end

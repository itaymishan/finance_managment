class AddHebrewNameToIncomeSource < ActiveRecord::Migration
  def change
    add_column :income_sources, :hebrew_name, :string
  end
end

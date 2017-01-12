class AddBackfillDateToExpense < ActiveRecord::Migration
  def up
    Expense.all.each do |ex|
      ex.date = Date.new(ex.year, ex.month, 1)
      ex.save!
    end
  end
end

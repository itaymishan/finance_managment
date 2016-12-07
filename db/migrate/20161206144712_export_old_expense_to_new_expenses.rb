class ExportOldExpenseToNewExpenses < ActiveRecord::Migration
  def data
    OldExpense.all.each do |old_expense|
      category = Category.find_or_create_by(hebrew_name: old_expense.category)
      user = User.find_or_create_by(first_name: old_expense.person)
      expense_type = old_expense.expense_type == 'אישי' ? 'personal' : 'home'
      currency = Currency.find_or_create_by(name: old_expense.currency)
      luxury = old_expense.is_luxury == 'כן' ? true : false

      expense = Expense.create!(year: old_expense.year,
                      month: old_expense.month,
                      user: user,
                      category: category,
                      expense_type: expense_type,
                      amount: old_expense.amount.to_d,
                      currency: currency,
                      luxury: luxury,
                      comments: old_expense.comments)
    end
  end
end

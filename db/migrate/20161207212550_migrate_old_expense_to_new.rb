class MigrateOldExpenseToNew < ActiveRecord::Migration
  def up
    Expense.delete_all
    OldExpense.all.each{|old| migrate_old_to_new(old)}
  end

  def down
    Expense.delete_all
  end

  def migrate_old_to_new(old)
    print '#'
    category = Category.find_or_create_by(hebrew_name: old.category.strip)
    user = User.find_or_create_by(first_name: old.person)
    expense_type = old.expense_type == 'אישי' ? 'personal' : 'home'
    currency = Currency.find_or_create_by(name: old.currency)
    luxury = old.is_luxury == 'כן' ? true : false

    expense = Expense.create!(year: old.year,
                    month: old.month,
                    user: user,
                    category: category,
                    expense_type: expense_type,
                    amount: old.amount.to_d,
                    currency: currency,
                    luxury: luxury,
                    comments: old.comments)
  end

end

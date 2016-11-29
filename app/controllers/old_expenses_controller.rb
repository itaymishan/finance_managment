class OldExpensesController < ApplicationController

  def create
    @old_expense = OldExpense.create(old_expense_params)
    render action: :index
  end

  def index
    @old_expenses = OldExpense.order(:id).last(20).reverse
  end

  def new
    @old_expense = OldExpense.new
  end

  def old_expense_params
    params.require(:old_expense).permit(:month, :expense_type, :year, :category, :person, :amount, :comments, :currency)
  end

end

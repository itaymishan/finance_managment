class OldExpensesController < ApplicationController

  def create
    @old_expense = OldExpense.create(old_expense_params)
    render json: @old_expense, status: :created
  end

  def index
    @old_expenses = OldExpense.order(:year, :month).last(10000).reverse
  end

  def new
    @old_expense = OldExpense.new
  end

  def old_expense_params
    params.require(:old_expense).permit(:month, :expense_type, :year, :category, :person, :amount, :comments, :currency)
  end

end

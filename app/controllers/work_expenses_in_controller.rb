class WorkExpensesInController < ApplicationController
  def create
    @old_expense = WorkExpenseIn.create(work_expense_params)
    render action: :index
  end

  def index
    @old_expenses = WorkExpenseIn.order(:id).last(20).reverse
  end

  def new
    @old_expense = WorkExpenseIn.new
  end

  def work_expense_params
    params.require(:work_expense_in).permit(:amount, :currency, :comments)
  end
end

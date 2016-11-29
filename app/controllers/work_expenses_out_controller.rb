class WorkExpensesOutController < ApplicationController
  def create
    @old_expense = WorkExpenseOut.create(work_expense_params)
    render action: :index
  end

  def index
    @old_expenses = WorkExpenseOut.order(:id).last(50).reverse
  end

  def new
    @old_expense = WorkExpenseOut.new
  end

  def work_expense_params
    params.require(:work_expense_out).permit(:amount, :currency, :comments)
  end

end

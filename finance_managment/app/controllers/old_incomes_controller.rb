class OldIncomesController < ApplicationController

  def create
    @old_income = OldIncome.create(work_expense_params)
    render action: :index
  end

  def index
    @old_incomes = OldIncome.order(:id).last(20).reverse
  end

  def new
    @old_income = OldIncome.new
  end

  def work_expense_params
    params.require(:old_income_params).permit(:year, :month, :income_src, :amount, :comments, :currency)
  end

end

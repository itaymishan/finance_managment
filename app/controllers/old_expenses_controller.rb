class OldExpensesController < ApplicationController

  before_action :set_expenses, on: :index

  def create
    @old_expense = OldExpense.create(old_expense_params)
    redirect_to :index
  end

  def index
    @old_expenses ||= OldExpense.last(50)
  end

  def new
    @old_expense = OldExpense.new
  end

  def old_expense_params
    params.require(:old_expense).permit(:month, :expense_type, :year, :category, :person, :amount, :comments, :currency)
  end

  def set_expenses
    if params[:filter].present?
      @old_expenses = OldExpense.where(year: params[:filter][:year], month: params[:filter][:month])
    end
  end

end

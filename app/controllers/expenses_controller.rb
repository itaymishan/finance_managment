class ExpensesController < ApplicationController

  before_filter :sanitize_expense_params
  before_action :set_expenses, on: :index

  def index
    @expenses.sort_by(&:created_at).reverse if @expenses.present?
  end

  def create
    if params[:repeat_times].present?
      times = params[:repeat_times].to_i
      i = 0
      while i < times do
        month = (expense_params[:month].to_i + i) % 12
        year_add = (expense_params[:month].to_i + i) / 12
        Expense.create(expense_params.merge({month: month, year: year_add+expense_params[:year].to_i}))
        i += 1
      end
    else
      @expense = Expense.create(expense_params)
    end
    redirect_to action: "new"
  end

  def new
    @expense = Expense.new
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def destroy
    @expense = Expense.find(params[:id])

    @expense.destroy!
    redirect_to action: "index"
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to @expense
    else
      render 'edit'
    end
  end

  def expense_params
    params.require(:expense).permit(:category_id, :amount, :comments, 
                                    :year, :month, :currency_id, 
                                    :expense_type, :user_id)
  end

  def sanitize_expense_params
    params[:income_source_id] = params[:income_source_id].to_i
    params[:amount] = params[:amount].to_i
    params[:year] = params[:year].to_i
    params[:month] = params[:month].to_i
    params[:currency_id] = params[:currency_id].to_i
    params[:category_id] = params[:category_id].to_i
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_expenses
    if params[:filter].present?
      @expenses = Expense.where(year: params[:filter][:year]) if params[:filter][:year].present?
      @expenses = @expenses.where(month: params[:filter][:month]) if params[:filter][:month].present?
      @expenses = @expenses.joins(:category).where(categories: { hebrew_name: params[:filter][:category] }) if params[:filter][:category].present?
    end
  end
end

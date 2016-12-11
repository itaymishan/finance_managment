class ExpensesController < ApplicationController

  before_filter :sanitize_page_params
  before_action :set_expenses, on: :index

  def index
    @expenses ||= Expense.last(50)
  end

  def create
    @expense = Expense.create(expense_params)
    # render json: @expense, status: :created
    redirect_to action: "index"
  end

  def new
    @expense = Expense.new
  end

  def show
  end

  def delete
  end

  def update
  end

  def expense_params
    params.require(:expense).permit(:category_id, :amount, :comments, :year, :month, :currency_id, :expense_type, :user_id)
  end

  def sanitize_page_params
    params[:income_source_id] = params[:income_source_id].to_i
    params[:amount] = params[:amount].to_i
    params[:year] = params[:year].to_i
    params[:month] = params[:month].to_i
    params[:currency_id] = params[:currency_id].to_i
    params[:category_id] = params[:category_id].to_i
  end

  def set_expenses
    if params[:filter].present?
      @expenses = Expense.where(year: params[:filter][:year], month: params[:filter][:month]).order(id: :desc)
    end
  end

end

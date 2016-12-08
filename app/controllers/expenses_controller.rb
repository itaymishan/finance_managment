class ExpensesController < ApplicationController

  before_action :set_expenses, on: :index

  def index
    @expenses
  end

  def create
  end

  def show
  end

  def delete
  end

  def update
  end

  def set_expenses
    if params[:filter].present?
      @expenses = Expense.where(year: params[:filter][:year], month: params[:filter][:month])
    end
  end

end

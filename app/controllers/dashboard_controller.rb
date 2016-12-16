class DashboardController < ApplicationController

  before_action :set_expenses, on: :index
  before_action :set_incomes, on: :index

  def show
  end

  def create

  end

  def index
    @expenses ||= Expense.last(50).sort_by(&:created_at)
    @incomes ||= Income.last(50).sort_by(&:created_at)
  end

  def new
  end

  def delete
  end

  def set_expenses
    if params[:filter].present?
      @expenses = Expense.where(year: params[:filter][:year], month: params[:filter][:month]).order(id: :desc)
    end
  end

  def set_incomes
    if params[:filter].present?
      @incomes = Income.where(year: params[:filter][:year], month: params[:filter][:month]).order(id: :desc)
    end
  end

end

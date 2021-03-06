class DashboardController < ApplicationController

  before_action :sanitize_dashboard_params
  before_action :set_expenses, on: :index
  before_action :set_incomes, on: :index

  def index
    @last_expenses = Expense.last(10)
    @last_incomes = Income.last(10)
    @monthly_summary = MonthlySummaryService.new.monthly_summary(params[:filter][:from_year]) if params[:filter].present?    
  end

  def set_expenses
    if params[:filter].present?
      @expenses = Expense.between_dates(params[:filter][:from_year],
                                        params[:filter][:from_month],
                                        params[:filter][:to_year],
                                        params[:filter][:to_month])
    end
  end

  def set_incomes
    if params[:filter].present?
      @incomes = Income.between_dates(params[:filter][:from_year],
                                        params[:filter][:from_month],
                                        params[:filter][:to_year],
                                        params[:filter][:to_month])
    end
  end

  def sanitize_dashboard_params
    params[:filter][:from_year] = params[:filter][:from_year].to_i unless params[:filter].blank?
    params[:filter][:from_month] = params[:filter][:from_month].to_i unless params[:filter].blank?
    params[:filter][:to_year] = params[:filter][:to_year].to_i unless params[:filter].blank?
    params[:filter][:to_month] = params[:filter][:to_month].to_i unless params[:filter].blank?
  end
end

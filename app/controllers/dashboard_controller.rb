class DashboardController < ApplicationController

  before_action :sanitize_dashboard_params
  before_action :set_expenses, on: :index
  before_action :set_incomes, on: :index

  def index
    @expenses ||= Expense.last(50).sort_by(&:created_at)
    @incomes ||= Income.last(50).sort_by(&:created_at)
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

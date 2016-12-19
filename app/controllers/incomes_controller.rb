class IncomesController < ApplicationController

  before_filter :sanitize_page_params
  before_action :set_incomes, on: :index
  before_action :set_income, except: [:index, :new]

  def show
  end

  def create
    @income = Income.new(income_params)
    if @income.save!
      redirect_to action: "index"
    end
  end

  def index
    @incomes ||= Income.last(10).sort_by(&:created_at).reverse
  end

  def new
    @income = Income.new
  end

  def update
    @income = Income.find(params[:id])

    if @income.update(income_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @income.destroy!
    redirect_to action: "index"
  end

  def income_params
    params.require(:income).permit(:income_source_id, :amount, :comments, :year, :month, :currency_id)
  end

  def sanitize_page_params
    params[:income_source_id] = params[:income_source_id].to_i
    params[:amount] = params[:amount].to_i
    params[:year] = params[:year].to_i
    params[:month] = params[:month].to_i
    params[:currency_id] = params[:currency_id].to_i
  end

  def set_incomes
    if params[:filter].present?
      @incomes = Income.where(year: params[:filter][:year], month: params[:filter][:month]).order(id: :desc)
    end
  end

  def set_income
    @income = Income.find(params[:id])
  end

end

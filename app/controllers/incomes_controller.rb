class IncomesController < ApplicationController

  before_filter :sanitize_income_params
  before_action :set_incomes, on: :index

  def show
    @income = Income.find(params[:id])
  end

  def create
    @income = Income.new(income_params)
    if @income.save!
      redirect_to action: "new"
    end
  end

  def index
    @incomes.order(:created_at) if @incomes.present?
    @summary ||= @incomes.joins(:currency).group('currencies.name').sum(:amount) if @incomes.present?
  end

  def new
    @income = Income.new
  end

  def edit
    @income = Income.find(params[:id])
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
    @income = Income.find(params[:id])

    @income.destroy!
    redirect_to action: "index"
  end

  def income_params
    params.require(:income).permit(:income_source_id, 
                                    :amount, :comments, :year, 
                                    :month, :currency_id)
  end

  def sanitize_income_params
    params[:income_source_id] = params[:income_source_id].to_i
    params[:amount] = params[:amount].to_i
    params[:year] = params[:year].to_i
    params[:month] = params[:month].to_i
    params[:currency_id] = params[:currency_id].to_i
  end

  def set_incomes
    if params[:filter].present?
      @incomes = Income.all
      @incomes = Income.where(year: params[:filter][:year]) if params[:filter][:year].present?
      @incomes = @incomes.where(month: params[:filter][:month]) if params[:filter][:month].present?      
      @incomes = @incomes.joins(:income_source).where(income_sources: { name: params[:filter][:income_source] }) if params[:filter][:income_source].present?
    end
  end

  def set_income
    @income = Income.find(params[:id])
  end

end

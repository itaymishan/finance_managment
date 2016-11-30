class OldIncomesController < ApplicationController

  def create
    @old_income = OldIncome.create!(old_income_params)
    render json: @old_income, status: :created
  end

  def index
    @old_incomes = OldIncome.order(:id).last(20).reverse
  end

  def new
    @old_income = OldIncome.new
  end

  def old_income_params
    params.require(:old_income).permit(:year, :month, :income_src, :amount, :comments, :currency)
  end

end

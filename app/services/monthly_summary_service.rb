class MonthlySummaryService

  def monthly_summary(s_year = DateTime.now.year)
    result = []

    for i in 1..12 do
      hash = {
        year: s_year, 
        month: i, 
        incomes: [], 
        expenses: []
      }

      incomes = monthly_income_group(s_year, i)
      expenses = monthly_expense_group(s_year, i)

      incomes.each{|income| hash[:incomes] << {total: income[1] , currency: income[0][2] }}
      expenses.each{|ex| hash[:expenses] << {total: ex[1] , currency: ex[0][2] }}

      result << hash
    end    
    result
  end

  def yearly_summary(s_year = DateTime.now.year)
    result = []
    for i in 2013..DateTime.now.year do
      hash = {
        year: i, 
        incomes: [], 
        expenses: []
      }

      incomes = yearly_income_group(s_year)
      expenses = yearly_expense_group(s_year)

      incomes.each{|income| hash[:incomes] << {total: income[1] , currency: income[0][2] }}
      expenses.each{|ex| hash[:expenses] << {total: ex[1] , currency: ex[0][2] }}

      result << hash
    end  
  end

  def yearly_expense_group(year)
    Expense.where(year: year)
      .joins(:currency)
      .group(:year, :month, 'currencies.name')
      .sum(:amount)
      .sort
  end

  def yearly_income_group(year)
    Income.where(year: year)
      .joins(:currency)
      .group(:year, :month, 'currencies.name')
      .sum(:amount)
      .sort
  end


  def monthly_expense_group(year, month)
    Expense.where(year: year).where(month: month)
      .joins(:currency)
      .group(:year, :month, 'currencies.name')
      .sum(:amount)
      .sort
  end

  def monthly_income_group(year, month)
    Income.where(year: year).where(month: month)
      .joins(:currency)
      .group(:year, :month, 'currencies.name')
      .sum(:amount)
      .sort
  end
end
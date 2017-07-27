class MonthlySummaryService

  def monthly_summary(s_year = DateTime.now.year)
    # year, month, total_expenses(all currencies), total_incomes(all currencies), cashflow
    result = []

    for i in 1..12 do
      hash = {}
      hash[:year] = s_year
      hash[:month] = i
      hash[:incomes] = []
      hash[:expenses] = []

      incomes = Income.where(year: s_year).where(month: i)
        .joins(:currency)
        .group(:year, :month, 'currencies.name')
        .sum(:amount)
        .sort

      expenses = Expense.where(year: s_year).where(month: i)
        .joins(:currency)
        .group(:year, :month, 'currencies.name')
        .sum(:amount)
        .sort

        incomes.each{|income| hash[:incomes] << {total: income[1] , currency: income[0][2] }}
        expenses.each{|ex| hash[:expenses] << {total: ex[1] , currency: ex[0][2] }}
        result << hash
    end      
    result
  end
end
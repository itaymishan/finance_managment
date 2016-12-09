class BackfillOldIncomeToNew < ActiveRecord::Migration
  def up
    OldIncome.all.each do |e|
      src = IncomeSource.find_or_create_by(name: e.income_src)
      currency = Currency.find_or_create_by(name: e.currency)
      Income.create!(year: e.year.to_i,
                      month: e.month.to_i,
                      income_source: src,
                      amount: e.amount.to_d,
                      comments: e.comments,
                      currency: currency)
    end
  end
end

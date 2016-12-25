module ApplicationHelper

  def currency_convert(from, to, amount)
    return amount if from == to
    @rates ||= ExchangeRate.all
    @rates.find_by(from: from, to: to).rate * amount
  end
end

# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ActiveRecord::Base
  # - Relations - #
  has_many :expenses
  has_many :incomes

  def convert_to(currency, amount)
    return amount if self.name == currency
    @rates ||= ExchangeRate.all
    @rates.find_by(from: self.name, to: currency).rate * amount
  end

end

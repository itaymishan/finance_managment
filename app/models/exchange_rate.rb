# == Schema Information
#
# Table name: exchange_rates
#
#  id         :integer          not null, primary key
#  from       :string           not null
#  to         :string           not null
#  rate       :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExchangeRate < ActiveRecord::Base
end

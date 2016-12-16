# == Schema Information
#
# Table name: incomes
#
#  id               :integer          not null, primary key
#  income_source_id :integer
#  amount           :decimal(, )      not null
#  comments         :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  year             :integer          not null
#  month            :integer          not null
#  currency_id      :integer          not null
#

class Income < ActiveRecord::Base

  belongs_to :income_source
  belongs_to :currency

  scope :income_groups, -> {
    Income.joins(:currency)
    .group('currencies.name')
    .joins(:income_source)
    .group('income_sources.name')
    .sum(:amount)
  }

end

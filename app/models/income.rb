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
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  scope :between_dates, -> (start_year, start_month, end_year, end_month) {
    where(year: start_year..end_year).where(month: start_month..end_month)
  }

  scope :income_groups, -> {
    Income.joins(:currency)
    .group('currencies.name')
    .joins(:income_source)
    .group('income_sources.name')
    .sum(:amount)
  }

end

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
#

class Income < ActiveRecord::Base

  belongs_to :income_source

end

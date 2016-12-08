# == Schema Information
#
# Table name: income_sources
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  active     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IncomeSource < ActiveRecord::Base

  has_many :incomes

end

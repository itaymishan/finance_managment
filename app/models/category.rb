# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  english_name :string
#  hebrew_name  :string
#  luxury       :boolean
#  active       :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Category < ActiveRecord::Base
  # - Relations - #
  has_many :expenses

  scope :active, -> { where(active: true) }
  
end

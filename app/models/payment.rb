# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ApplicationRecord
  #associations
  belongs_to :user
  has_many :payment_descriptions

  #validations
  validates :user, :year, presence: true
end

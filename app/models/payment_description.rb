# == Schema Information
#
# Table name: payment_descriptions
#
#  id              :integer          not null, primary key
#  payment_id      :integer
#  month           :integer
#  comment         :text
#  paid_up         :boolean
#  payment_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PaymentDescription < ApplicationRecord
  #associations
  belongs_to :payment
  belongs_to :payment_type

  #validations
  validates :month, :payment, :payment_type, :paid_up, presence: true
end

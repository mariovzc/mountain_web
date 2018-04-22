# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentType < ApplicationRecord
  validates :name, presence: true
end

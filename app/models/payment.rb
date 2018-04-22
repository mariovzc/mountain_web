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
  belongs_to :user

  validates :user, :year, presence: true
end

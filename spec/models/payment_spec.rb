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

require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:user) }
  end
  describe "Association" do
    it { should belong_to(:user) }
  end
end

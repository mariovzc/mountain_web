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

require 'rails_helper'

RSpec.describe PaymentDescription, type: :model do
  describe "validations" do
    it { should validate_presence_of(:month) }
    it { should validate_presence_of(:payment) }
    it { should validate_presence_of(:payment_type) }
    it { should validate_presence_of(:paid_up) }
  end
  describe "Association" do
    it { should belong_to(:payment) }
    it { should belong_to(:payment_type) }
  end

end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  document        :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  active          :boolean
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:document) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

  end
  describe "Associations" do
    it { should have_many(:payments) }
  end
end

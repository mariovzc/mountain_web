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

class User < ApplicationRecord
  has_secure_password
  
  #scopes
  #default_scope {where(active: true)}

  #Validations
  validates_presence_of :first_name, :email, :last_name, :document
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  #callbacks
  before_save :setup_user

  private
  def setup_user
    self.email = self.email.delete(' ').downcase
    self.active |= true
  end
end

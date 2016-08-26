class User < ActiveRecord::Base
  has_many :organizations
  has_many :members, dependent: :destroy
  has_many :org_members, through: :members, source: :organization

  validates :first_name, :last_name, :password, presence: true, on: [:create]
  validates :first_name, :last_name, :password, length: {minimum: 4}
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, :uniqueness => {case_sensitive: false}, :format => { :with => email_regex }
end

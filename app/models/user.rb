class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
  # has_secure_password
end

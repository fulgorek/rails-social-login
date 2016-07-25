class Session < ActiveRecord::Base
  has_no_table
  attr_accessor :email, :password, :string
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates_presence_of :password, if: -> { self.password }
end

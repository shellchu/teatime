class User < ActiveRecord::Base
  has_many :events, foreign_key: 'owner_id'
  has_secure_password
  validates_presence_of :email, :full_name, :password_confirmation
  validates_uniqueness_of :email
end

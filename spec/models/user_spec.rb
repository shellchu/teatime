require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:events).with_foreign_key('owner_id')}
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_secure_password }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_presence_of(:full_name) }
end

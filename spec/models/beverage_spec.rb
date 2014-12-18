require 'rails_helper'

RSpec.describe Beverage, :type => :model do
  it { should belong_to(:shop) }
end

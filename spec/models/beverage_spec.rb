require 'rails_helper'

RSpec.describe Beverage, :type => :model do
  it { should belong_to(:shop) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:price) }
  it { should validate_inclusion_of(:size).in_array(%w(Small Medium Large)) }

  describe "#name_with_size" do
    it "returns beverage name with size" do
      beverage = Fabricate(:beverage, name: "Tea", size: "Large")
      expect(beverage.name_with_size).to eq("Tea (Large)")
    end
  end
  
end

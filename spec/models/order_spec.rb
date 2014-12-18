require 'rails_helper'

RSpec.describe Order, :type => :model do
  it { should belong_to(:beverage) }
  it { should belong_to(:event) }

  describe "#beverage_name" do
    it "returns name of beverage in order" do
      order = Fabricate(:order)
      expect(order.beverage_name).to eq(order.beverage.name)
    end
  end

  describe "#size" do
    it "returns size of beverage in order" do
      order = Fabricate(:order)
      expect(order.size).to eq(order.beverage.size)
    end
  end

  describe "#price" do
    it "returns price of beverage in order" do
      order = Fabricate(:order)
      expect(order.price).to eq(order.beverage.price)
    end
  end

  describe "validate ice" do
    it "can't set value if hot is ture" do
      order = Fabricate.build(:order, hot: true, ice: "70%")
      expect(order.save).to be_falsey
    end

    it "can't be blank if hot is false" do
      order = Fabricate.build(:order, hot: false, ice: nil)
      expect(order.save).to be_falsey
    end
  end
end

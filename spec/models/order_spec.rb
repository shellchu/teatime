require 'rails_helper'

RSpec.describe Order, :type => :model do
  it { should belong_to(:beverage) }
  it { should belong_to(:event) }
  it { should belong_to(:user) }

  it do
    should validate_inclusion_of(:ice).
      in_array(%w(0% 30% 50% 70% 100%))
  end
  it do
    should validate_inclusion_of(:sugar).
    in_array(%w(0% 30% 50% 70% 100%))
  end

  describe "#beverage_name" do
    it "returns name of beverage in order" do
      order = Fabricate(:order, beverage: Fabricate(:beverage))
      expect(order.beverage_name).to eq(order.beverage.name)
    end
  end

  describe "#size" do
    it "returns size of beverage in order" do
      order = Fabricate(:order, beverage: Fabricate(:beverage))
      expect(order.size).to eq(order.beverage.size)
    end
  end

  describe "#price" do
    it "returns price of beverage in order" do
      order = Fabricate(:order, beverage: Fabricate(:beverage))
      expect(order.price).to eq(order.beverage.price)
    end
  end

  describe "#user_full_name" do
    it "returns full name of user" do
      order = Fabricate(:order)
      expect(order.user_full_name).to eq(order.user.full_name)
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

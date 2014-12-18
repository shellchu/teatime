class Order < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :event

  delegate :name, to: :beverage, prefix: :beverage
  delegate :size, to: :beverage
  delegate :price, to: :beverage

  validates :ice, absence: true, if: :hot
  validates :ice, inclusion: { in: %w(0% 30% 50% 70% 100%) }, unless: :hot

  def user
    "Mr.XXX"
  end


end

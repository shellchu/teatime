class Order < ActiveRecord::Base
  belongs_to :beverage
  belongs_to :event
  belongs_to :user

  delegate :name, to: :beverage, prefix: :beverage
  delegate :size, to: :beverage
  delegate :price, to: :beverage
  delegate :full_name, to: :user, prefix: :user

  validates :ice, absence: true, if: :hot
  validates :ice, inclusion: { in: %w(0% 30% 50% 70% 100%) }, unless: :hot
  validates :sugar, inclusion: { in: %w(0% 30% 50% 70% 100%) }

end

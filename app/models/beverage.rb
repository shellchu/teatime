class Beverage < ActiveRecord::Base
  belongs_to :shop
  validates_presence_of :name, :size, :price
  validates :size, inclusion: { in: %w(Small Medium Large) }
  
  def name_with_size
    "#{name} (#{size})"
  end
end

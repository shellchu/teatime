class Beverage < ActiveRecord::Base
  belongs_to :shop

  def name_with_size
    "#{name} (#{size})"
  end
end

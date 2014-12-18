class Event < ActiveRecord::Base
  default_scope { order("end_time DESC") }
  belongs_to :shop
  has_many :orders
  delegate :name, to: :shop, prefix: :shop

  def host
    "Fake Host"
  end

  def active?
    end_time > Time.now
  end
end

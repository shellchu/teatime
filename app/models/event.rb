class Event < ActiveRecord::Base
  default_scope { order("end_time DESC") }
  belongs_to :shop
  belongs_to :owner, class_name: 'User'
  has_many :orders
  delegate :name, to: :shop, prefix: :shop

  validate :end_time_cannot_be_in_the_past

  def host
    "Fake Host"
  end

  def active?
    end_time > Time.now
  end

  protected
  def end_time_cannot_be_in_the_past
    if end_time < DateTime.now
      errors.add(:end_time, "can't be in the past")
    end
  end
end

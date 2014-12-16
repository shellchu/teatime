class Event < ActiveRecord::Base
  default_scope { order("end_time DESC") }

  def host
    "Fake Host"
  end

  def shop_name
    "Fake shop"
  end

  def active?
    end_time > Time.now
  end
end

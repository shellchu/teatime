module EventsHelper
  def show_order_type(is_hot)
    is_hot ? "Hot" : "Cold"
  end

  def show_order_ice(ice)
    ice ||= '-'
  end
end

module ShopsHelper
  def show_beverage_type(beverage)
    if beverage.hot && beverage.cold
      "H/C"
    elsif beverage.hot
      "Hot"
    else
      "Cold"
    end
  end
end

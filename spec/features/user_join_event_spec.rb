require 'rails_helper'

feature "User joins event" do
  scenario "user orders a hot beverge", :js => true do
    shop = Fabricate(:shop)
    beverages = Fabricate.times(5, :beverage, shop: shop)
    event = Fabricate(:event, shop: shop)
    sign_in
    expect(page).to have_content event.shop_name

    click_link 'Join'
    expect(page).to have_content('Order')
    expect(current_path).to eq(event_path(event))

    click_link 'Order'
    expect(page).to have_xpath("//input[@value='Apply']")
    expect(current_path).to eq(new_event_order_path(event))

    select "#{beverages.second.name} (#{beverages.second.size})", from: "Beverage"
    check 'Is Hot?'
    expect(page).not_to have_content('Ice')
    select "0%", from: "Sugar"
    click_button 'Apply'
    expect(page).to have_content beverages.second.name
  end

  scenario "user can't join the expired event" do
    create_expired_event
    sign_in
    expect(page).not_to have_content 'Join'
  end

  def create_expired_event
    Fabricate.build(:event, end_time: 1.day.ago).save(validate: false)
  end
end

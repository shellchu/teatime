require 'rails_helper'

feature "User joins event" do
  scenario "user orders a hot beverge and update it", :js => true do
    shop = Fabricate(:shop)
    beverages = Fabricate.times(5, :beverage, shop: shop)
    event = Fabricate(:event, shop: shop)
    sign_in
    expect(page).to have_content event.shop_name

    click_link 'Join'
    expect_to_have_order_btn
    click_link 'Order'
    expect_to_have_apply_btn
    select_a_hot beverages.second
    expect_not_to_have_ice_option
    click_button 'Apply'
    expect_to_have_ordered beverages.second

    click_link 'Edit'
    expect_to_have_apply_btn
    expect_not_to_have_ice_option
    select_a_cold beverages.first
    expect_to_have_ice_option
    click_button 'Apply'
    expect_to_have_ordered beverages.first
  end

  scenario "user can't join the expired event" do
    create_expired_event
    sign_in
    expect(page).not_to have_content 'Join'
  end

  def create_expired_event
    Fabricate.build(:event, end_time: 1.day.ago).save(validate: false)
  end

  def expect_to_have_order_btn
    expect(page).to have_content('Order')
  end
  def expect_to_have_apply_btn
    expect(page).to have_xpath("//input[@value='Apply']")
  end

  def select_a_hot(beverage)
    select "#{beverage.name} (#{beverage.size})", from: "Beverage"
    check 'Is Hot?'
    select "0%", from: "Sugar"
  end

  def select_a_cold(beverage)
    select "#{beverage.name} (#{beverage.size})", from: "Beverage"
    uncheck 'Is Hot?'
    select "0%", from: "Sugar"
  end

  def expect_not_to_have_ice_option
    expect(page).not_to have_content('Ice')
  end

  def expect_to_have_ice_option
    expect(page).to have_content('Ice')
  end

  def expect_to_have_ordered(beverage)
    expect(page).to have_content beverage.name
  end
end

require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "GET index" do
    it "sets @events variable" do
      event = Fabricate(:event)
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET show" do
    it "sets @event variable" do
      event = Fabricate(:event)
      get :show, id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it "sets @shop variable" do
      event = Fabricate(:event)
      get :show, id: event.id
      expect(assigns(:shop)).to eq(event.shop)
    end

    it "sets @orders variable" do
      event = Fabricate(:event)
      get :show, id: event.id
      expect(assigns(:orders)).to eq(event.orders)
    end
  end
end

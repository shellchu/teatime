require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  before { set_user }
  describe "GET index" do
    it_behaves_like "require_login" do
      let(:action) { get :index }
    end

    it "sets @events variable" do
      event = Fabricate(:event)
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET show" do
    let(:event) { Fabricate(:event) }

    it_behaves_like "require_login" do
      let(:action) { get :show, id: event.id }
    end

    it "sets @event variable" do
      get :show, id: event.id
      expect(assigns(:event)).to eq(event)
    end

    it "sets @shop variable" do
      get :show, id: event.id
      expect(assigns(:shop)).to eq(event.shop)
    end

    it "sets @orders variable" do
      get :show, id: event.id
      expect(assigns(:orders)).to eq(event.orders)
    end
  end
end

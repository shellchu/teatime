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

  describe "GET new" do
    it_behaves_like "require_login" do
      let(:action) { get :new }
    end

    it "sets @event variabe which are owned by current user" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
      expect(assigns(:event).owner).to eq(user)
    end
  end

  describe "POST create" do
    let(:shop) { Fabricate(:shop) }
    it_behaves_like "require_login" do
      let(:action) { post :create, event: { shop_id: shop.id, end_time: 1.day.from_now } }
    end

    context "with vaild input" do
      before do
        post :create, event: { shop_id: shop.id, end_time: 1.day.from_now }
      end
      it "redirects to home page" do
        expect(response).to redirect_to home_path
      end
      it "creates event record" do
        expect(Event.count).to eq(1)
      end
    end

    context "with invaild input" do
      before do
        post :create, event: { shop_id: shop.id, end_time: 1.day.ago }
      end
      it "renders the :new template" do
        expect(response).to render_template :new
      end
      it "does not create event record" do
        expect(Event.count).to eq(0)
      end
      it "sets the @event variable" do
        expect(assigns(:event)).to be_kind_of(Event)
      end
    end
  end
end

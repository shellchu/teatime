require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  before { set_user }
  let(:shop) { Fabricate(:shop) }
  let!(:beverages) { Fabricate.times(5, :beverage, shop: shop) }
  let(:event) { Fabricate(:event, shop: shop) }
  describe "GET new" do
    it_behaves_like "require_login" do
      let(:action) { get :new, event_id: event.id }
    end

    it "sets @order variable" do
      get :new, event_id: event.id
      expect(assigns(:order)).to be_a_new(Order)
    end

    it "sets @event variable" do
      get :new, event_id: event.id
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET edit" do
    let!(:order) { Fabricate(:order, event: event, user: user) }
    it_behaves_like "require_login" do
      let(:action) { get :edit, id: order.id, event_id: event.id }
    end

    it "sets @order variable" do
      get :edit, id: order.id, event_id: event.id
      expect(assigns(:order)).to eq(order)
    end

    it "sets @event variable" do
      get :edit, id: order.id, event_id: event.id
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST create" do
    it_behaves_like "require_login" do
      let(:order) { Fabricate(:order, event: event) }
      let(:action) { post :create, event_id: event.id, order: {
        beverage_id: order.beverage.id,
        hot: order.hot,
        ice: order.ice,
        sugar: order.sugar } }
    end

    context "with valid input" do
      let(:order) { Fabricate.build(:order, event: event) }
      before do
        post :create, event_id: event.id, order: {
          beverage_id: order.beverage.id,
          hot: order.hot,
          ice: order.ice,
          sugar: order.sugar }
      end
      it "redirects to event show page" do
        expect(response).to redirect_to event_path(event)
      end

      it "saves the order record" do
        expect(Order.count).to eq(1)
      end

      it "belongs to signed user" do
        expect(Order.first.user).to eq(user)
      end
    end

    context "with invalid input" do
      let(:order) { Fabricate.build(:order, event: event, ice: "wrong") }
      before do
        post :create, event_id: event.id, order: {
          beverage_id: order.beverage.id,
          hot: order.hot,
          ice: order.ice,
          sugar: order.sugar }
        end
      it "renders the new template" do
        expect(response).to render_template :new
      end

      it "does not save the order record" do
        expect(Order.count).to eq(0)
      end

      it "sets @order variable" do
        expect(assigns(:order)).to be_kind_of(Order)
      end

      it "sets @event variable" do
        expect(assigns(:event)).to eq(event)
      end
    end
  end

  describe "PUT update" do
    it_behaves_like "require_login" do
      let(:order) { Fabricate(:order, event: event) }
      let(:action) { put :update, event_id: event.id, id: order.id, order: {
        beverage_id: order.beverage.id,
        hot: order.hot,
        ice: order.ice,
        sugar: order.sugar } }
    end

    context "with valid input" do
      let(:order) { Fabricate(:order, event: event, sugar: "0%") }
      before do
        put :update, id: order.id, event_id: event.id, order: {
          beverage_id: order.beverage.id,
          hot: order.hot,
          ice: order.ice,
          sugar: "70%" }
      end
      it "redirects to event show page" do
        expect(response).to redirect_to event_path(event)
      end
      it "updates the order record" do
        expect(Order.first.sugar).to eq("70%")
      end
    end

    context "with invalid input" do
      let(:order) { Fabricate(:order, event: event, sugar: "0%") }
      before do
        put :update, id: order.id, event_id: event.id, order: {
          beverage_id: order.beverage.id,
          hot: true,
          ice: "50%",
          sugar: "70%" }
      end
      it "renders the edit template" do
        expect(response).to render_template :edit
      end
      it "dose not update the order record" do
        expect(Order.first.sugar).to eq("0%")
      end

      it "sets the @event variable" do
        expect(assigns(:event)).to be_kind_of(Event)
      end
      it "sets the @order variable" do
        expect(assigns(:order)).to be_kind_of(Order)
      end
    end
  end
end

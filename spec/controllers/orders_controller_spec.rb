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

  describe "POST create" do
    it_behaves_like "require_login" do
      let(:order) { Fabricate(:order, event: event) }
      let(:action) { post :create, event_id: event.id, order: {
        beverage_id: order.beverage.id,
        hot: order.hot,
        ice: order.ice,
        sugar: order.sugar } }
    end

    context "with vaild input" do
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

    context "with invaild input" do
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
end

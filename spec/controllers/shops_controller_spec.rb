require 'rails_helper'

RSpec.describe ShopsController, :type => :controller do
  before { set_user }
  describe "GET show" do
    let(:shop) { Fabricate(:shop) }

    it_behaves_like "require_login" do
      let(:action) { get :show, id: shop.id }
    end

    it "sets @shop variable" do
      get :show, id: shop.id
      expect(assigns(:shop)).to eq(shop)
    end

    it "sets @beverages variable" do
      get :show, id: shop.id
      expect(assigns(:beverages)).to eq(shop.beverages)
    end
  end

end

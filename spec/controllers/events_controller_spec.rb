require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "GET index" do
    it "sets @events variable" do
      event = Fabricate(:event)
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end
end

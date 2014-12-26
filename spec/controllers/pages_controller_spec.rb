require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET front" do
    it "redirects to home page if user signed in" do
      set_user
      get :front
      expect(response).to redirect_to home_path
    end
  end
end

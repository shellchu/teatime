require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "GET new" do
    it "renders new page if user have not signed in" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to home page if user have signed in" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "with vaild credentials" do
      let(:user) { Fabricate(:user) }
      before do
        post :create, email: user.email, password: user.password
      end

      it "redirects to home page" do
        expect(response).to redirect_to home_path
      end

      it "signs in user in the session" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "flash success message" do
        expect(flash[:success]).not_to be_blank
      end
    end

    context "with invaild credentials" do
      let(:user) { Fabricate(:user) }
      before do
        post :create, email: "wrong email", password: "wrong password"
      end

      it "renders new page" do
        expect(response).to render_template :new
      end

      it "does not sign in user in the session" do
        expect(session[:user_id]).to be_nil
      end

      it "flashes the error message" do
        expect(flash[:danger]).not_to be_blank
      end
    end
  end
end

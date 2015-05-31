require 'spec_helper'

describe SessionsController do

  describe "GET new" do
    it "redirects to the home path if the user is logged in" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    it "sets the user variable based on the email entered" do
      current_user = Fabricate(:user)
      post :create, email: User.first.email
      expect(assigns(:user)).to eq(current_user)
    end

    it "sets session[:user_id] to the @user.id when the @user is authenticated" do
      user = Fabricate(:user)
      post :create, email: user.email, password: user.password
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to home_path
    end

    it "redirects to the sign in path when user enters an invalid email" do
      user = Fabricate(:user)
      post :create, email: "cat@cat.com", password: user.password
      expect(response).to redirect_to sign_in_path
    end

    it "redirects ot the sign in path when the user enters an invalid password" do
      user = Fabricate(:user)
      post :create, email: user.email, password: "cat"
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "GET destroy" do
    it "sets session[:user_id] to nil" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
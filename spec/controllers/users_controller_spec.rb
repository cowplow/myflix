require 'spec_helper'

describe UsersController do

  describe "GET new" do

    it "can't register if already logged in" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to categories_path
    end

    it "sets the @user variable" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end

  end

  describe "POST create" do

    it "creates the user when the input is valid" do
      post :create, user: Fabricate.attributes_for(:user)
      expect(User.count).to eq(1)
    end

    it "redirects to the sign_in_path when input is valid" do
      post :create, user: { name: "Chris", password: "password", email: "chris@example.com" }
      expect(response).to redirect_to sign_in_path
    end

    it "does not create a user when the input is invalid" do
      post :create, user: {name: Faker::Name.name, password: 'password'}
      expect(User.count).to eq(0)
    end

    it "renders the new template when the input is invalid" do
      post :create, user: {name: Faker::Name.name, password: 'password'}
      expect(response).to render_template :new
    end
  end

  describe "GET edit" do

    it "sets the @user variable for the id that was entered" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it "redirects to the categories_path when @user is not the current user" do
      current_user = Fabricate(:user)
      user = Fabricate(:user)
      session[:user_id] = current_user.id
      get :edit, id: user.id
      expect(response).to redirect_to categories_path
    end
  end

  describe "POST update" do

    it "redirects to the categories_path when @user is not the current user" do
      current_user = Fabricate(:user)
      user = Fabricate(:user)
      session[:user_id] = current_user.id
      post :update, id: user.id
      expect(response).to redirect_to categories_path
    end

    it "updates @user when the input is valid" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :update, id: user.id, user: {name: "Charles", password: user.password, email: user.email}
      expect(User.first.name).to eq("Charles")
    end

    it "does not update @user when the input is invalid" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :update, id: user.id, user: {name: user.name, password: "cat", email: user.email}
      expect(User.first.password).not_to eq("cat") 
    end
  end

  describe "GET show" do 

    it "sets the @user when the input is valid" do
      user = Fabricate(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end
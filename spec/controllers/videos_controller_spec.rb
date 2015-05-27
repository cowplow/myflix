require 'spec_helper'

describe VideosController do

  describe "GET show" do

    it "sets the @video variable for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end


    it "redirects the user to the sign in page for unauthenticated users" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "Post search" do

    it "sets the @videos variable for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: 'Futurama')
      post :search, title: 'rama'
      expect(assigns(:videos)).to eq([futurama])
    end

    it "redirects to the sign in page for unauthorized users" do
      futurama = Fabricate(:video, title: 'Futurama')
      post :search, title: 'rama'
      expect(response).to redirect_to sign_in_path
    end
  end
end
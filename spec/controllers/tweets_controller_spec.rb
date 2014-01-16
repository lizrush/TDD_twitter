require 'spec_helper'

describe TweetsController do

  describe "get index" do
    let!(:tweet) {create(:tweet)}

    it "is successful" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @tweets" do
      get :index
      expect(assigns(:tweet).first).to be_an_instance_of Tweet
    end
  end

  describe "POST create" do

    it "is successful" do 
      post :create, tweet: {user: "userguy", body: "this is a tweet"}
      expect(response).to redirect_to tweets_path(assigns(:tweet).id)
    end
  end

  context "when invalid" do

    it "is unsuccessful but still redirects" do
      post :create, tweet: {user: "userguy2", body: nil}
      expect(response).to render_template :index
    end
  end
end

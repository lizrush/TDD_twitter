require 'spec_helper'

describe TweetsController do

  describe "get index" do

    it "is successful" do
      get :index
      expect(response).to be_successful
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

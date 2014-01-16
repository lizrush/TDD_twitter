require 'spec_helper'

describe Tweet do

  describe "validations" do

    it "must have a body" do
      expect(Tweet.new(body: nil, user: "user1")).to_not be_valid
    end

    it "counts its characters" do
      expect(Tweet.new(body: "tweet" * 100, user: "user2").character_count).to eq 500
    end

    it "can have 140 characters in body" do
      expect(Tweet.new(body: "Z" * 140, user: "user3")).to be_valid
    end

    it "can't have 141 characters in body" do
      expect(Tweet.new(body: "Z" * 141, user: "user3")).to_not be_valid
    end

    it "must have an user" do
      expect(Tweet.new(body: "this doesnt have a user", user: nil)).to_not be_valid
    end
  end
end
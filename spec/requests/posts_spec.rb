require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    let!(:posts) { FactoryGirl.create_list(:post, 20) }
    it "works! (now write some real specs)" do
      get posts_path
      response.status.should be(200)
      body = JSON.parse(response.body)
      expect(body.length).to eq posts.length
    end
  end
end

require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    let!(:users) { FactoryGirl.create_list(:user, 20) }
    it "works! (now write some real specs)" do
      get users_path
      response.status.should be(200)
      body = JSON.parse(response.body)
      expect(body.length).to eq users.length
    end
  end
end

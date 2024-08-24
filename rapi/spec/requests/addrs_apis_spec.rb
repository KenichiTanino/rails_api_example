require 'rails_helper'

RSpec.describe "AddrsApis", type: :request do
  describe "GET /addrs_apis" do
    it "works! (now write some real specs)" do
      get "/addrs"
      expect(response).to have_http_status(200)
    end
  end
end

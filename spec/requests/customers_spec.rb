require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! (now write some real specs)" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "works! 200 ok" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: (be_kind_of Integer),
        name: (be_kind_of String),
        email: (be_kind_of String),
      ])
    end
  end
end


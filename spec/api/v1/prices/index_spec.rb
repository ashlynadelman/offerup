require "rails_helper"

RSpec.describe "prices#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/prices", params: params
  end

  describe "basic fetch" do
    let!(:price1) { create(:price) }
    let!(:price2) { create(:price) }

    it "works" do
      expect(PriceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["prices"])
      expect(d.map(&:id)).to match_array([price1.id, price2.id])
    end
  end
end

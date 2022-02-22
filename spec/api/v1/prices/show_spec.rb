require "rails_helper"

RSpec.describe "prices#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/prices/#{price.id}", params: params
  end

  describe "basic fetch" do
    let!(:price) { create(:price) }

    it "works" do
      expect(PriceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("prices")
      expect(d.id).to eq(price.id)
    end
  end
end

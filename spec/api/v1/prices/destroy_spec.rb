require "rails_helper"

RSpec.describe "prices#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/prices/#{price.id}"
  end

  describe "basic destroy" do
    let!(:price) { create(:price) }

    it "updates the resource" do
      expect(PriceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Price.count }.by(-1)
      expect { price.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

require 'rails_helper'

RSpec.describe "prices#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/prices/#{price.id}", payload
  end

  describe 'basic update' do
    let!(:price) { create(:price) }

    let(:payload) do
      {
        data: {
          id: price.id.to_s,
          type: 'prices',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PriceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { price.reload.attributes }
    end
  end
end

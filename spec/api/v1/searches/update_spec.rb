require "rails_helper"

RSpec.describe "searches#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/searches/#{search.id}", payload
  end

  describe "basic update" do
    let!(:search) { create(:search) }

    let(:payload) do
      {
        data: {
          id: search.id.to_s,
          type: "searches",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SearchResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { search.reload.attributes }
    end
  end
end

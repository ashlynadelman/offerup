require 'rails_helper'

RSpec.describe "searches#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/searches/#{search.id}"
  end

  describe 'basic destroy' do
    let!(:search) { create(:search) }

    it 'updates the resource' do
      expect(SearchResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Search.count }.by(-1)
      expect { search.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

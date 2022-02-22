require 'rails_helper'

RSpec.describe "searches#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/searches/#{search.id}", params: params
  end

  describe 'basic fetch' do
    let!(:search) { create(:search) }

    it 'works' do
      expect(SearchResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('searches')
      expect(d.id).to eq(search.id)
    end
  end
end

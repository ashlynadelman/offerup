require 'rails_helper'

RSpec.describe "searches#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/searches", params: params
  end

  describe 'basic fetch' do
    let!(:search1) { create(:search) }
    let!(:search2) { create(:search) }

    it 'works' do
      expect(SearchResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['searches'])
      expect(d.map(&:id)).to match_array([search1.id, search2.id])
    end
  end
end

require 'rails_helper'

RSpec.describe PriceResource, type: :resource do
  describe 'serialization' do
    let!(:price) { create(:price) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(price.id)
      expect(data.jsonapi_type).to eq('prices')
    end
  end

  describe 'filtering' do
    let!(:price1) { create(:price) }
    let!(:price2) { create(:price) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: price2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([price2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:price1) { create(:price) }
      let!(:price2) { create(:price) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            price1.id,
            price2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            price2.id,
            price1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

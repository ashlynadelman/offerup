require 'rails_helper'

RSpec.describe PriceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'prices',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PriceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Price.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:price) { create(:price) }

    let(:payload) do
      {
        data: {
          id: price.id.to_s,
          type: 'prices',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PriceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { price.reload.updated_at }
      # .and change { price.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:price) { create(:price) }

    let(:instance) do
      PriceResource.find(id: price.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Price.count }.by(-1)
    end
  end
end

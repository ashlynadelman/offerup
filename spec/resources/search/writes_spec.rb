require "rails_helper"

RSpec.describe SearchResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "searches",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SearchResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Search.count }.by(1)
    end
  end

  describe "updating" do
    let!(:search) { create(:search) }

    let(:payload) do
      {
        data: {
          id: search.id.to_s,
          type: "searches",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SearchResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { search.reload.updated_at }
      # .and change { search.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:search) { create(:search) }

    let(:instance) do
      SearchResource.find(id: search.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Search.count }.by(-1)
    end
  end
end

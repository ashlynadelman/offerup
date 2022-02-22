require "rails_helper"

RSpec.describe SearchResource, type: :resource do
  describe "serialization" do
    let!(:search) { create(:search) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(search.id)
      expect(data.jsonapi_type).to eq("searches")
    end
  end

  describe "filtering" do
    let!(:search1) { create(:search) }
    let!(:search2) { create(:search) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: search2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([search2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:search1) { create(:search) }
      let!(:search2) { create(:search) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      search1.id,
                                      search2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      search2.id,
                                      search1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

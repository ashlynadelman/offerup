require "rails_helper"

RSpec.describe Price, type: :model do
  describe "Direct Associations" do
    it { should have_many(:searches) }

    it { should have_many(:item_titles) }
  end

  describe "InDirect Associations" do
    it { should have_many(:categories) }

    it { should have_many(:users) }
  end

  describe "Validations" do
  end
end

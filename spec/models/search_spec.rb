require "rails_helper"

RSpec.describe Search, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should belong_to(:price) }

    it { should belong_to(:item) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

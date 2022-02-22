require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:item_titles) }

    end

    describe "InDirect Associations" do

    it { should have_many(:categories) }

    end

    describe "Validations" do

    end
end

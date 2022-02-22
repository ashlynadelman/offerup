require 'rails_helper'

RSpec.describe Price, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:item_titles) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

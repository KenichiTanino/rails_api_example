# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Addr, type: :model do
    # let(:addr) { build(:addr) } # FactoryBot
    # Start redis with docker-compose up redis beforehand.
    describe Addr do
      it "Addr new is not nil" do
        addr = Addr.new()
        expect(addr).not_to eq nil
      end
      it "Addr add" do
        addr = Addr.new()
        expect(addr.add(:name => "n", :birthday => "b", :gender => 1, :address => "aa2", :job => "j", :note => "n")).to include "aid:"
      end
    end
end
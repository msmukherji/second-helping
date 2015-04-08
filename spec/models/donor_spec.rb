require 'rails_helper'

RSpec.describe Donor, type: :model do
  it "can create a donation" do
    donor = FactoryGirl.create :donor
    params = {name: "noodles", description: "oodles", requirements: "tonight", auto_confirm: false}
    donation = donor.create_donation params#{}"noodles", "oodles of them", "tonight"
    
    expect(Donation.first.donor_id).to eq donor.id
  end

  it "can.. something about new?"

  it "can confirm a claim on a donation" do
    claim = FactoryGirl.create :claim
    donor = claim.donation.donor
    donor.approve_claim claim

    expect(claim.approved?).to eq true
  end

  it "cannot confirm a claim on anothers donation" do
    claim = FactoryGirl.create :claim
    donor = FactoryGirl.create :donor
    #donor.approve_claim claim

    expect {donor.approve_claim claim}.to raise_error(RuntimeError)
    expect(claim.approved?).to eq false
  end

end
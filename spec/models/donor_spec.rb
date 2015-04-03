require 'rails_helper'

RSpec.describe Donor, type: :model do
  it "can create a donation" do
    donor = FactoryGirl.create :donor
    params = {name: "noodles", description: "oodles", requirements: "tonight", auto_confirm: false}
    donation = donor.create_donation params#{}"noodles", "oodles of them", "tonight"
    
    expect(Donation.first.donor_id).to eq donor.id
  end

  # it "cannot create a donation if not logged in as a donor" do 
  #   donation = Donation.create name: "noodles", description: "oodles of them", requirements: "tonight"
  #   expect(donations.all).to eq nil
  # end
  # # ^^ not great

  it "can.. something about new?"

  it "can confirm a claim on a donation" do
    claim = FactoryGirl.create :claim
    donor = claim.donation.donor
    donor.approve_claim claim

    expect(claim.approved?).to eq true
  end

  # DO I NEED THISvv TEST ON THE MODEL? 

  it "cannot confirm a claim on anothers donation" do
    claim = FactoryGirl.create :claim
    donor = FactoryGirl.create :donor
    donor.approve_claim claim

    expect(claim.approved?).to eq false
  end

end
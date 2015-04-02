require 'rails_helper'

describe ClaimsController do

  it "can show a claim" do
    donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
    login donor
    donation = Donation.create name: "noodles", description: "oodles of them", requirements: "tonight", donor_id: donor.id, claimed: true
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh" 
    claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    get :show
    expect(response.code.to_i).to eq 200
  end

  it "cannot show a claim if not the corresponding donor" do
    donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
    login donor
    donation = Donation.create name: "noodles", description: "oodles of them", requirements: "tonight", donor_id: 2, claimed: true
    get :show
    expect(response.code.to_i).to eq 404 
  end

  fit "allows a donor to approve a claim" do
    claim = FactoryGirl.create :claim
    donor = claim.donation.donor
    login donor
    post :confirm, claim_id: claim.id
  
    expect(response.code.to_i).to eq 200
    claim.reload
    expect(claim.approved?).to eq true
  end

  fit "does not allow donors to approve other claims" do
    claim = FactoryGirl.create :claim
    donor = FactoryGirl.create :donor
    login donor
    post :confirm, claim_id: claim.id

    expect(response.code.to_i).to eq 404
    expect(json["error"]).to eq "not found"
    claim.reload
    expect(claim.approved?).to eq false
  end

  it "requires donors to be logged in to approve claims"

end
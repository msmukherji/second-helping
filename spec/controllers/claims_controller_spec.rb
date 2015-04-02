require 'rails_helper'

describe ClaimsController do

  fit "allows a recipient to claim a donation" do
    recipient = FactoryGirl.create :recipient
    donation = FactoryGirl.create :donation
    login recipient
    post :create, recipient_id: recipient.id, donation_id: donation.id
    expect(response.code.to_i).to eq 200
  end

  # it "does not allow a donor to claim a donation" do
  #   donation = FactoryGirl.create :donation
  #   donor = FactoryGirl.create :donor
  #   login donor
  #   post :create, recipient_id: ???
  # end

  it "can show a claim" do
    claim = FactoryGirl.create :claim
    login claim.donation.donor
    get :show, claim_id: claim.id
    expect(response.code.to_i).to eq 200
  end

  it "does not show a claim to a different donor" do
    claim = FactoryGirl.create :claim
    donor = FactoryGirl.create :donor
    login donor
    get :show, claim_id: claim.id
    expect(response.code.to_i).to eq 404
  end

  # it "requires a donor to be logged in to view a claim" do
  #   claim = FactoryGirl.create :claim
  #   # donor = claim.donation.donor
  #   get :show, claim_id: claim.id
  #   expect(response.code.to_i).to eq 404
  # end

  it "allows a donor to approve a claim" do
    claim = FactoryGirl.create :claim
    donor = claim.donation.donor
    login donor
    post :confirm, claim_id: claim.id
  
    expect(response.code.to_i).to eq 200
    claim.reload
    expect(claim.approved?).to eq true
  end

  it "does not allow donors to approve other claims" do
    claim = FactoryGirl.create :claim
    donor = FactoryGirl.create :donor
    login donor
    post :confirm, claim_id: claim.id

    expect(response.code.to_i).to eq 404
    expect(json["error"]).to eq "not found"
    claim.reload
    expect(claim.approved?).to eq false
  end

  # fit "requires donors to be logged in to approve claims" do
  #   claim = FactoryGirl.create :claim
  #   donor = FactoryGirl.create :donor
  #   post :confirm, claim_id: claim.id

  #   #expect(response.code.to_i).to eq 404
  #   expect(json["error"]).to eq "not found"
  #   claim.reload
  #   expect(claim.approved?).to eq false
  # end

end
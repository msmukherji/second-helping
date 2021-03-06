require 'rails_helper'

RSpec.describe Recipient, type: :model do

  it "can create a claim on a donation" do
    recipient = FactoryGirl.create :recipient
    donation = FactoryGirl.create :donation
    recipient.claim_donation donation

    expect(Claim.all.count).to eq 1
    expect(Claim.first.recipient_id).to eq recipient.id
  end

  it "can create a claim on a donation with a claim" do
    recipient = FactoryGirl.create :recipient
    claim = FactoryGirl.create :claim
    recipient.claim_donation claim.donation

    expect(Claim.all.count).to eq 2
    expect(Claim.find_by(recipient_id: recipient.id).donation_id).to eq claim.donation_id
  end

  it "cannot create a claim if donation already has an approved claim" do
    recipient = FactoryGirl.create :recipient
    claim = FactoryGirl.create :claim
    donor = claim.donation.donor
    donor.approve_claim claim 
    # ^^ or, instead of the two lines above? :
    # claim.update approved: true
    recipient.claim_donation claim.donation

    expect(Claim.find_by(recipient_id: recipient.id)).to eq nil
  end

  it "sends an email to notify about a new claim" do
    recipient = FactoryGirl.create :recipient
    donor = FactoryGirl.create :donor
    donation = Donation.create donor_id: donor.id, name: "some food", expiration: "April 12, 2015"
    claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    expect { recipient.notify_claimed claim }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end

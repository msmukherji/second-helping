require 'rails_helper'

RSpec.describe Donor, type: :model do
  it "can create a donation" do
    donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
    login donor
    donor.create_donation "noodles", 
    donation = Donation.create name: "noodles", donor_id: donor.id, description: "oodles of them", requirements: "tonight"
    expect(donor.donations.first.id).to eq donation.id
  end
  # VERY BAD NOT TESTING ANYTHING

  it "cannot create a donation if not logged in as a donor" do 
    donation = Donation.create name: "noodles", description: "oodles of them", requirements: "tonight"
    expect(donations.all).to eq nil
  end
  # ^^ not great

  it "can confirm a claim on a donation" do
    donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
    login donor
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation = Donation.create name: "noodles", donor_id: donor.id, description: "oodles of them", requirements: "tonight"
    claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    donor.approve_claim claim
    expect(claim.approved).to eq true
  end

  it "cannot confirm a claim on a donation if not corresponding donor" do
    donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
    login donor
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation = Donation.create name: "noodles", donor_id: 3, description: "oodles of them", requirements: "tonight"
    claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    donor.approve_claim claim
    expect(donation.approved).to eq false
    # because donor.id doesn't match the donor_id of the donation that donor is trying to claim
  end

end
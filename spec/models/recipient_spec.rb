require 'rails_helper'

RSpec.describe Recipient, type: :model do
  # it "can see a single donation" do
  #   recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
  #   login recipient
  #   donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
  #   get :show, donation_id: donation.id
  #   #expect(??)
  # end
 
  # it "can see all the donations" do
  #   recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
  #   login recipient
  #   donation1 = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
  #   donation2 = Donation.create name: "pie", donor_id: 2, description: "all the pie", requirements: "tomorrow"
  #   get :index
  #   #expect(??)
  # end

  # ^^ are these actually controller tests?

  # it "can change the donation status to claimed" do
  #   recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
  #   login recipient
  #   donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
  #   recipient.claim_donation donation
  #   expect(donation.claimed).to eq true
  # end

  # it "cannot change the donation status to claimed if not a recipient" do
  #   donor = Donor.create email: "mishka@fake.com", password: "password", name: "mishka", role: "flunky", contact_number: "5555555555"
  #   login donor
  #   donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
  #   donor.claim_donation donation
  #   expect(donation.claimed).to eq false
  #   # this is not a good test!
  # end

  # ^^ is any of this necessary????

  it "can create a claim on a donation" do
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    recipient.claim_donation donation
    expect(Claim.all.count).to eq 1
    expect(Claim.first.id).to eq recipient.claim.first.id
  end

  it "cannot create a claim on a donation if not logged in as a recipient" do
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
 
    donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    recipient.claim_donation donation
    expect(Claim.all.count).to eq 0
  end

end

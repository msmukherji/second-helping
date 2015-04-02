require 'rails_helper'

describe DonationsController do

  it "can show a single donation to a recipient" do
    recipient = FactoryGirl.create :recipient #Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation = FactoryGirl.create :donation #Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    get :show, donation_id: donation.id
    expect(response.code.to_i).to eq 200
  end

  it "does not allow non-recipients to see a donation" do
    donor = FactoryGirl.create :donor
    login donor
    donation = FactoryGirl.create :donation
    get :show, donation_id: donation.id
    expect(response.code.to_i).not_to eq 200
  end

  it "requires recipients to be logged in to see a donation" do
    recipient = FactoryGirl.create :recipient
    donation = FactoryGirl.create :donation
    get :show, donation_id: donation.id
    expect(response.code.to_i).not_to eq 200
  end

  it "can show all the donations" do
    recipient = FactoryGirl.create :recipient #Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation1 = FactoryGirl.create :donation
    donation2 = FactoryGirl.create :donation
    get :index
    expect(response.code.to_i).to eq 200
  end

  it "does not allow non-recipients to see all the donations" do
    donor = FactoryGirl.create :donor
    login donor
    donation1 = FactoryGirl.create :donation
    donation2 = FactoryGirl.create :donation
    get :index
    expect(response.code.to_i).not_to eq 200
  end

  it "requires recipients to be logged in to see all the donation" do
    recipient = FactoryGirl.create :recipient
    donation1 = FactoryGirl.create :donation
    donation2 = FactoryGirl.create :donation
    get :index
    expect(response.code.to_i).not_to eq 200
  end

  # it "lets a donor start a new donation" do
  #   donor = FactoryGirl.create :donor
  #   login donor
  #   post :new, donor_id: donor.id
  #   expect(json).to include(donor.organization)
  #   # expect(Donation.first.donor_id).to eq donor.id
  #   # NOT SURE ABOUT THIS, ISN'T RETURNING JSON FOR SOME REASON
  # end

  it "does not allow non-donors to start a new donation"

  it "requires donor to be logged in to start a new donation"

  it "lets a donor make a new donation" do
    donor = FactoryGirl.create :donor
    login donor
    post :create, donor_id: donor.id
    expect(response.code.to_i).to eq 200
    expect(Donation.first.donor_id).to eq donor.id 
  end

  it "does not allow a non-donor to make a new donation" do
    recipient = FactoryGirl.create :recipient
    login recipient
    post :create, donor_id: recipient.id
    expect(response.code.to_i).not_to eq 200
    expect(Donation.all.count).to eq 0
  end

  it "requires donor to be logged in to make a new donation" do
    donor = FactoryGirl.create :donor
    post :create, donor_id: donor.id
    expect(response.code.to_i).not_to eq 200
    expect(Donation.all.count).to eq 0 
  end

  # EVENTUALLY: WILL NEED TESTS TO SAY THAT
  # YOU CAN'T MAKE DONATIONS ON BEHALF OF AN ORGANIZATION 
  # IF YOU DON'T BELONG TO IT, AND YOU CAN'T BELONG TO 
  # AN ORGANIZATION IF NOT APPROVED..?
  # DOES THIS GET IN THE WAY OF USER EASE?

end
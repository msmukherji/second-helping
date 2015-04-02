require 'rails_helper'

describe DonationsController do

  it "can show a single donation to a recipient" do
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    get :show, donation_id: donation.id
    expect(response.code.to_i).to eq 200
  end
 
  it "can show all the donations" do
    recipient = Recipient.create email: "josh@fake.com", password: "password", name: "josh"
    login recipient
    donation1 = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    donation2 = Donation.create name: "pie", donor_id: 2, description: "all the pie", requirements: "tomorrow"
    get :index
    expect(response.code.to_i).to eq 200
  end

  it "cannot show donations to non-recipients" do
    donation1 = Donation.create name: "noodles", donor_id: 1, description: "oodles of them", requirements: "tonight"
    donation2 = Donation.create name: "pie", donor_id: 2, description: "all the pie", requirements: "tomorrow"
    get :show, donation_id: donation1.id
    expect(response.code.to_i).to eq 404
    get :index
    expect(response.code.to_i).to eq 404
  end

end
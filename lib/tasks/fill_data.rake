namespace :fill_data do
  desc "Make fake data"
  task :fill => :environment do 
    donors = []
    10.times do
      donors << (FactoryGirl.create :donor)
    end
  
    donations = []
    donors.each do |donor|
      donations << (Donation.create! donor_id: donor.id, description: "food")
    end

    recipients = []
    10.times do
      recipients << (FactoryGirl.create :recipient)
    end

    for i in (0..9) do
      Claim.create!(recipient_id: recipients[i].id, donation_id: donations[i].id)
    end

    # BETTER WAY:
    # recipients.zip(donations).each do |rec, don|
    #   Claim.create! recipient_id: rec.id, donation_id: don.id
    # end
 
  end

end

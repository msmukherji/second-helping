require "rails_helper"


RSpec.describe DonorMailer, type: :mailer do
 
 

  #describe 'notify_confirmed' do
    # donor = FactoryGirl.create :donor
    # donation = Donation.create donor_id: donor.id, name: "foodz", expiration: "April 20, 2015"
    # recipient = FactoryGirl.create :recipient
    # claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    # mail = DonorMailer.notify_confirmed claim

    # it 'renders the subject' do
    #   donor = FactoryGirl.create :donor
    #   donation = Donation.create donor_id: donor.id, name: "foodz", expiration: "April 20, 2015"
    #   recipient = FactoryGirl.create :recipient
    #   claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    #   mail = DonorMailer.notify_confirmed claim
      
    #   expect(mail.subject).to eq 'Claim approved!'
    # end
 
    # it 'renders the receiver email' do
    #   donor = FactoryGirl.create :donor
    #   donation = Donation.create donor_id: donor.id, name: "foodz", expiration: "April 20, 2015"
    #   recipient = FactoryGirl.create :recipient
    #   claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    #   mail = DonorMailer.notify_confirmed claim
      
    #   expect(mail.to).to eq recipient.email
    # end
 
    # it 'renders the sender email' do
    #   donor = FactoryGirl.create :donor
    #   donation = Donation.create donor_id: donor.id, name: "foodz", expiration: "April 20, 2015"
    #   recipient = FactoryGirl.create :recipient
    #   claim = Claim.create donation_id: donation.id, recipient_id: recipient.id
    #   mail = DonorMailer.notify_confirmed claim
      
    #   expect(mail.from).to eq 'secondhelping@example.com'
    # end
 
    # it 'assigns @name' do
    #   expect(mail.body.encoded).to match(user.name)
    # end
 
    # it 'assigns @confirmation_url' do
    #   expect(mail.body.encoded).to match("http://aplication_url/#{user.id}/confirmation")
    # end

  #end

end

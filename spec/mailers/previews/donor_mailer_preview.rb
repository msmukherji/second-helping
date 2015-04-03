# Preview all emails at http://localhost:3000/rails/mailers/donor_mailer
class DonorMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    donor = FactoryGirl.create :donor
    DonorMailer.sample_email(donor)
  end
end

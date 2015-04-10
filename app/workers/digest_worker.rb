class DigestWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  recurrence do
    daily
  end

  def perform
    recipients = Recipient.where digest: true
    recipients.each do |recipient|
      mailer = DigestMailer.digest_email recipient
      mailer.deliver_later
    end
  end

end
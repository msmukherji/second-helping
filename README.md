# Second Helping

### Purpose
This app provides a marketplace where restaurants or events with unspoiled leftover food can connect with local food pantries with the ability to distribute this food.

### Functions
Users can register on the site as either a Donor or a Recipient.  As a Donor (such as a conference planner or a bakery employee), they can post items they would like to donate, with a description, an expiration date, and specifications for pickup.  As a Recipient (such as a food pantry), they can peruse these postings and claim any that they can use and logistically obtain.  When an item is claimed, the entity that made it available is notified by email, and optionally, by text message.  At that point, they can approve the claim, again through a link in their email or by text message.  The pantry or kitchen whose claim was approved is notified that their claim was successful (also by email and/or text), and both parties are then responsible for carrying out the physical transaction.  Recipient entities can also opt to receive a daily digest email notifying them of newly posted and available items.

### Technologies
On the back end, this Rails application makes use of two Devise models; Twilio for the text component; and Redis, Sidekiq, and Sidetiq for the ActionMailer jobs that generate emails.  The front end was built in Angular.js, using HTML5 and CSS3 for the page views, as well as Gimp and Sketch for image manipulation.

### Notes
Second Helping was built as a final project for a Ruby on Rails class at the Iron Yard coding academy's DC campus.  The creators have gone on to work on implementing some of the features they built for this project in a similar application that is live.  Please contact mishka.s.mukherji@gmail.com if this interests you.
json.donor_name @donor.name

	@donor.donations.each do |donation|
		json.donation_name donation.name
		json.id donation.id
		json.description donation.description
		json.requirements donation.requirements
		json.expiration donation.expiration
		json.auto_confirm donation.auto_confirm
	
end
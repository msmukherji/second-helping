json.donations @donations do |donation|
	json.name donation.name
	json.donation_id donation.id
	if donation.donor.organization
		json.organization donation.donor.organization
	end
	json.description donation.description
	json.requirements donation.requirements
	if donation.claims
		json.claims donation.claims do |claim|
			json.claimant claim.recipient.name
			json.approved claim.approved
		end
	end
end     
json.donation do
	json.name @donation.name
	json.donor @donation.donor
	json.donation_id @donation.id
	json.organization @donation.donor.organization
	json.description @donation.description
	json.requirements @donation.requirements
	json.expiration @donation.expiration
	if @donation.claims
		json.claims @donation.claims do |claim|
			json.claimant claim.recipient.name
			json.approved claim.approved
		end
	end
end    

json.claim @claim do
	json.donating_organization @claim.donor.organization
	json.recipient @claim.recipient
	json.donation @claim.donation
	json.approved @claim.approved
end
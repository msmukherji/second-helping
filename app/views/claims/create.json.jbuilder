json.claim @claim do
	json.recipient @claim.recipient
	json.donation @claim.donation
	json.approved @claim.approved
end
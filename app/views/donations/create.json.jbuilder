json.donation do
	json.name @donation.name
	json.donor @donation.donor
	json.id @donation.id
	json.description @donation.description
	json.requirements @donation.requirements
	json.auto_confirm @donation.auto_confirm
end


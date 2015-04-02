json.donation @donation do
	json.name @donation.name
	# json.id @donation.id
	json.description @donation.description
	json.requirements @donation.requirements
	json.contact_number @donation.contact_number
	json.auto_confirm @donation.auto_confirm
end
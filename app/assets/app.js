var express = require('express');
var path = require('path');

var app = express();

app.use(express.static(path.join(__dirname, 'public')));
app.get("/", function(req, res){
  res.sendFile(path.join(__dirname, 'public/index.html'))
})

var donorData = [
	{
		organization: "Good Stuff Eatery",
		donor: "Pete",
		donor-contact: "pete@aol.com",
		donation: "Fifty pounds of rutabegas",
		requirements: "Must be picked up by 9:30 tomorrow",
		auto-confirm: true
	}
]

var donationsData = [
	{
		organization: "Good Stuff Eatery",
		donor: "Pete",
		donor-contact: "pete@aol.com",
		donation: "Fifty pounds of rutabegas",
		requirements: "Must be picked up by 9:30 tomorrow",
		approved: false
	}
]

var donationData = [
	{
		organization: "Good Stuff Eatery",
		donor: "Pete",
		donation_id: 3477790,
		donor-contact: "pete@aol.com",
		donation: "Fifty pounds of rutabegas",
		requirements: "Must be picked up by 9:30 tomorrow",
		approved: false		
	}
]

var donorNotificationData = {
	[
		status: "okay"
	]
}

var claimData = {
	[
		status: "okay"
	]
}


app.get("/api/donors/donation", function(req, res){
	res.json(donorData)
})

app.post("/api/donors/donation", function(req, res){
  res.json(donorData)
})

app.get("/api/donations", function(req, res){
	res.json(donationsData)
})

app.post("/api/donations/:donation_id", function(req, res){
  res.json(donationsData)
})

app.get("/api/donations/:donation_id", function(req, res){
	res.json(donationData)
})

app.post("/api/notify/:donation_id", function(req, res){
  res.json(donorNotificationData)
})

app.post("/api/confirm/:claim_id", function(req, res){
  res.json(claimData)
})

module.exports = app;

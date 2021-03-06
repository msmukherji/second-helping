Rails.application.routes.draw do

  devise_for :recipients, controllers: {registrations: 'recipients/registrations'}
  devise_for :donors, controllers: {registrations: 'donors/registrations'}

  root 'application#home'
  get '/donor'                    => 'donors#show', as: 'donor_root'
  get '/recipient'                => 'recipients#show', as: 'recipient_root'
  
  get '/about/bio'                => 'infos#bio'
  get '/about/texts'              => 'infos#screenshots'
  get '/about/tech'               => 'infos#tech'

  get '/donations'                => 'donations#index'
  get '/donations/:donation_id'   => 'donations#show'
  get '/donors/donation'          => 'donations#new'
  post '/donors/donation'         => 'donations#create'

  post '/donations/:donation_id'  => 'claims#create' # creates claim and notifies donor
  get '/claims/:claim_id'         => 'claims#show' # shows donor their claimed donation
  get '/confirm/:claim_id'        => 'claims#show_confirm', as: "show_confirm_claim"
  post '/confirm/:claim_id'       => 'claims#confirm', as: "confirm_claim"

  post '/confirm_by_text'         => 'claims#confirm_by_text'

  get '/donor/donations'          => 'donations#show_donors'

end

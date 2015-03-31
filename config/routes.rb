Rails.application.routes.draw do

  devise_for :recipients
  devise_for :donors

  root 'application#index'

  get '/donations'                => 'donations#show_all'
  get '/donations/:donation_id'   => 'donations#show'
  get '/donors/donation'          => 'donations#new'
  post '/donors/donation'         => 'donations#create'

  post '/donations/:donation_id'  => 'claims#create' # creates claim and notifies donor
  get '/claims/:claim_id'         => 'claims#show' # shows donor their claimed donation
  post '/confirm/:claim_id'       => 'claims#confirm'

end

Rails.application.routes.draw do

  devise_for :recipients
  devise_for :donors

  root 'application#index'

  # get '/donations' => 'donations#show_all'
  # get '/donations/:donation_id' => 'donations#show'
  # get '/donors/donation' => 'donations#new'
  # post '/donors/donation' => 'donations#create'

  # post '/donations/:donation_id' => 'claims#create'
  # post '/notify/:donation_id' => 'claims#notify'
  # post '/confirm/:claim_id' => 'claims#confirm'

end

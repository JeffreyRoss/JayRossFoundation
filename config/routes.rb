Rails.application.routes.draw do
  get 'main/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#home'

  #General Content routes
  get '/about-us',    to: 'main#aboutus',     as: 'aboutus'
  get '/initiatives', to: 'main#initiatives', as: 'initiatives'
  get '/take-action', to: 'main#takeaction',  as: 'takeaction'
  get '/our-impact',  to: 'main#ourimpact',   as: 'ourimpact' 
  get '/contact',     to: 'main#contact',     as: 'contact'  
  get '/team',        to: 'main#team',        as: 'team'  
  get '/about-jay',   to: 'main#aboutjay',    as: 'aboutjay'    


  devise_for :users
  resources :users 
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/test', to: 'weather#test'
  post '/search', to: 'weather#search'
  post '/myarea', to: 'weather#geolocation'

end

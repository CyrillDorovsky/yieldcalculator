Rails.application.routes.draw do
  root to: 'home#index'
  post '/calculate', to: 'home#calculate'
end

Rails.application.routes.draw do
  resources :invests
  match "/invests/calculate_investment_value" => "invests#calculate_investment_value", via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'invests#index'
end

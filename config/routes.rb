Rails.application.routes.draw do
  resources :schedules
  get 'schedules/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete "schedules/:id" => "schedules#destroy"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :schedules
end

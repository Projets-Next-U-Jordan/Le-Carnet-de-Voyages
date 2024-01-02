Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    resources :users do
      collection do
        get "test" => :test
        get "test2" => :test
      end
    end
    resources :trips do
      collection do
        post "create_ajax" => :create_ajax
        put "update_ajax/:id" => :update_ajax
        delete "destroy_ajax/:id" => :destroy_ajax
      end
    end
  end

  root "home#index"

  get "/trips" => "trips#index", as: :index_trips
  get "/trips/new" => "trips#new", as: :new_trip
  get "/trips/edit/:id" => "trips#edit", as: :edit_trip

end

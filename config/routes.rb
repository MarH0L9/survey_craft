Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Keep answers independent for submissions
  resources :answers

  # Nest questions inside surveys to create the /surveys/:survey_id/questions relationship
  resources :surveys do
    # Custom route for the public user view to answer the survey
    member do
      get :answer
    end

    resources :questions
  end

  # Defines the application root path route ("/")
  root "surveys#index"
end
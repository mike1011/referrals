Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:  "users/registrations",
    invitations: 'users/invitations'
  }

  ## ==== API ROUTES =====
  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations:  "api/v1/users/registrations",
      }
    end

  end

  root to: "home#index"
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:  "users/registrations",
    invitations: 'users/invitations'
  }
  root to: "home#index"
end

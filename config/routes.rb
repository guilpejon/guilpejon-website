Rails.application.routes.draw do
  devise_for :admin_users, {
    path: :admin,
    controllers: {
      sessions: "active_admin/devise/sessions",
      # passwords: "active_admin/devise/passwords",
      # unlocks: "active_admin/devise/unlocks",
      # registrations: "active_admin/devise/registrations",
      # confirmations: "active_admin/devise/confirmations"
    },
    path_names: {
      sign_in: "login",
      sign_out: "logout"
    },
    sign_out_via: [:delete, :get]
  }

  ActiveAdmin.routes(self)
  resources :articles, only: [:index, :show], path: :blog
  resources :images, only: [:index]

  root 'static_pages#home'
end

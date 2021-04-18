Rails.application.routes.draw do
  devise_for :admin_users, {
    path: :admin,
    controllers: {
      sessions: 'active_admin/devise/sessions'
    },
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    },
    sign_out_via: %i[delete get]
  }

  ActiveAdmin.routes(self)
  resources :articles, only: %i[index show], path: :blog
  resources :images, only: %i[index]
  resources :musics, only: %i[index show]
  post 'send_contact_email', to: 'contacts#send_email'
  get 'contact', to: 'static_pages#contact'

  root 'static_pages#home'
end

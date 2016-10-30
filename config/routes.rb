Rails.application.routes.draw do
  
  get 'dashboard/index'

   get 'geopuntos/pokestops'
   get 'geopuntos/pkstops_gyms'
   get 'geopuntos/gyms'


   resources :geo_elementos
  
   root to: "home#index"
   get '/home' => 'home#index', as: :home

   devise_for :admins, :skip => [:registrations]
   as :admins do
      get 'admins/edit' => 'devise/registrations#edit', :as => :edit_admin_registration
      patch 'admins/:id' => 'devise/registrations#update', :as => 'admin_registration'
      delete 'admins/:id' => 'devise/registrations#destroy', :as => 'admin_destroy'
   end
   
   devise_for :users, 
      :controllers => {
          :sessions => 'users/sessions',
          :registrations => 'users/registrations',
          :omniauth_callbacks => 'users/omniauth_callbacks' },
      :path => '/',
      :path_names => {
          :sign_in  => 'login',
          :sign_out => 'logout',
          :sign_up => 'registrarse'  }

   devise_scope :user do
      get '/login', to: 'devise/sessions#new', :as => :login
      get '/logout', to: 'devise/sessions#destroy', :as => :logout
      # post "/completar_registro", to: "users/omniauth_callbacks#completar_registro"
      match "/completar_registro",
      to: "users/omniauth_callbacks#completar_registro",
      as: :omni_completar_registro,
      via: [:get, :patch]
   end




   get '/dashboard' => 'dashboard#index', as: :user_root
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

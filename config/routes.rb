Rails.application.routes.draw do
  # ==========================================
  # PHASE 2: API Endpoints (JSON for Postman)
  # ==========================================
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
     devise_scope :user do
        post 'login', to: 'users/sessions#create'
        post 'signup', to: 'users/registrations#create'
        delete 'logout', to: 'users/sessions#destroy'
      end

      resources :mcp_servers, only: [:index, :show]
      resources :connections, only: [:create, :destroy]
      resources :clients, only: [:index, :show, :destroy]
  end
end

  # ==========================================
  # PHASE 1: Web UI Routes (HTML for Browser)
  # ==========================================
  # This creates the standard web login pages (e.g., /users/sign_in)
  devise_for :users 

  # Connections
  post   "connect_server/:mcp_server_id",    to: "connections#create",  as: :connect_server
  delete "disconnect_server/:mcp_server_id", to: "connections#destroy", as: :disconnect_server
  
  # Settings
  get   "settings", to: "users#edit",   as: :settings
  patch "settings", to: "users#update"

  resources :mcp_servers do
    resources :tools
  end

  resources :clients

  root "mcp_servers#index"
end
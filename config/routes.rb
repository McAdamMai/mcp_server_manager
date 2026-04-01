Rails.application.routes.draw do
  get "clients/show"
  # 1. Custom Authentication Routes (No Devise yet!)
  get    "signup", to: "users#new"
  post   "signup", to: "users#create"
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  post   "connect_server/:mcp_server_id",    to: "connections#create",  as: :connect_server
  delete "disconnect_server/:mcp_server_id", to: "connections#destroy", as: :disconnect_server
  get   "settings", to: "users#edit",   as: :settings
  patch "settings", to: "users#update"

  # 2. The Nested Resource (10 Points)
  # This makes URLs look like: /mcp_servers/1/tools
  resources :mcp_servers do
    resources :tools
  end

  # 3. Standard Resources
  resources :clients
  resources :users, only: [:create]

  # 4. The Root Path
  # This is the page that loads when someone goes to your main URL (e.g., localhost:3000)
  root "mcp_servers#index"
end
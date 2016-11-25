Spree::Core::Engine.add_routes do
  devise_scope :spree_user do
    match "/users/auth/:action/callback",
      constraints: { action: /google|facebook|amazon/ },
      to: "omniauth_callbacks",
      as: :spree_user_omniauth_callback_backup,
      via: [:get, :post]
  end
  
  resources :user_authentications

  get 'account' => 'users#show', as: 'user_root'

  namespace :admin do
    resources :authentication_methods
  end
end

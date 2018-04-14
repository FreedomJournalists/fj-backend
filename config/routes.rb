Rails.application.routes.draw do
    resources :users, :campaigns, :pledges, :defaults => { :format => :json }
    get "me", to: :me, controller: 'sessions'
    get "login", to: :login, controller: 'sessions'
    patch "me", to: :me, controller: 'sessions'
end

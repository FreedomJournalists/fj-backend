Rails.application.routes.draw do
    resources :users, :campaigns, :defaults => { :format => :json }
    get "me", to: :me, controller: 'sessions'
    get "login", to: :login, controller: 'sessions'
end

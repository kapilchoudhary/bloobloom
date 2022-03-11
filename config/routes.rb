Rails.application.routes.draw do
 
  
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :frames
        resources :lenses
      end
      namespace :user do
        resources :frames
        resources :lenses
        resources :glasses 
      end
    end
  end
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :glasses
  resources :users, param: :_username


  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :frames
        resources :lenses
      end
      namespace :user do
        resources :frames
        resources :lenses
      end
    end
  end

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  #post "auth/login", to: "authentication#login"
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

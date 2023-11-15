Rails.application.routes.draw do
  get 'contact/index', to: 'contact#index', as: 'contact'
  post 'send_cv', to: 'user_mailer#send_cv'
  get 'home/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "home#index"
end

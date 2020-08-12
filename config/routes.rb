Rails.application.routes.draw do
  root to: 'home#index'

  get 'index' => 'home#index'
  get 'quote' => 'home#quote'
  get 'corporate' => 'home#corporate'
  get 'residential' => 'home#residential'
  get 'login' => 'home#login'
  get 'thankyou' => 'home#thankyou'
  post 'home', to: "home#create"
  post 'leads', to: "leads#create"
  get '404' => 'home#404'
  authenticated :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
    get 'intervention' => 'intervention#intervention'
  end
  
  
  
  #devise_for :users

  ActiveAdmin.routes(self)

  #Devise
  



  devise_for :users
  devise_scope :user do
    get '/users/sign_in' => 'devise/session#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  # devise_for :users, ActiveAdmin::Devise.config
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*path' => redirect('/404')
end

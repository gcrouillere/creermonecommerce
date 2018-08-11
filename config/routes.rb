Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => "app_specific_registration/registrations"}
  mount Attachinary::Engine => "/attachinary"

  # resources :ceramiques, only: [:create, :index, :destroy, :show]
  scope do
    resources :ceramiques, path: ENV['MODEL'], only: [:create, :index, :destroy, :show]
  end

  resources :orders, only: [:show, :create, :destroy] do
    resources :payments, only: [:new, :create]
  end
  resources :users, only: [:show, :update, :create]
  resources :lessons, only: [:new, :create, :destroy, :show]
  get '/stage_confirmation', to: 'lessons#stage_confirmation'
  get '/stage_payment_confirmation', to: 'lessons#stage_payment_confirmation'

  #Pages
  get '/confirmation', to: 'pages#confirmation'
  get '/info', to: 'pages#info'
  get '/contact', to: 'pages#contact'
  get '/cgv', to: 'pages#cgv'
  get '/legal', to: 'pages#legal'
  get '/home', to: 'pages#home'
  get '/product_claim_details', to: 'pages#product_claim_details'
  get '/google906057532e2dbb7e', to: 'pages#google906057532e2dbb7e'
  get '/robots.:format', to: 'pages#robots'
  # , :defaults => { :format => 'txt' }

  #Sitemap
  get 'sitemap.xml', :to => 'sitemap#sitemap', :defaults => { :format => 'xml' }

  #Root
  root to: 'pages#offerpresentation'

  #Subscribe
  post '/user-subscribe', to: "users#subscribe"

  #Errors
  get "/404", to: "errors#error_404"

  #API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :shipping_categories, only: [:show]
      resources :promos, only: [:show]
    end
  end
end

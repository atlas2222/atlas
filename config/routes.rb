Rails.application.routes.draw do

  root to: "home#index"
  get 'home/faq'
  get 'home/about'
  get 'home/contact'
  post 'home/subscribe' => 'home#subscribe'
  post 'home/post_message' => 'home#post_message'
  
  get 'profile' => "profile#profile_index"
  get 'activities' => "activities#activities_index"

  get '.well-known/pki-validation/EFA74CF984F7F60821F4D259ACBB7BA0.txt' => 'temp#temp', as: 'temp'

  #withdrawl
  get 'withdrawls/new' => "withdrawls#new"

  #deposit
  get 'deposit/initiate_payment' => "payment#initiate_payment"
  get 'deposit/payment_pending' => "payment#payment_pending"
  
  # get 'activity/new'
  # get 'activity/create'
  
  get 'admin/index'
  get 'admin/users_activities'
 
  namespace :admin do
    get 'users/:user_id/deposits' => 'edit#get_deposits', as: 'user_deposits'
    get 'users/:user_id/withdrawls' => 'edit#get_withdrawls', as: 'user_withdrawls'

    patch 'users/transaction/:transaction_id/edit' => 'edit#transaction_edit', as: 'transaction_edit'
  end

  devise_for :users

  namespace :admin do
    resources :qr, only: [:new, :create, :edit, :update]
    resources :users, only: [] do
  	  resources :activity, only: [:new, :create]
      resources :profile, only: [:new, :create]
    end
  end

end

Rails.application.routes.draw do
  root to: 'challenge#index'
  get 'winners' => 'challenge#winners'

  get 'call/me' => 'call_me#index'
  post 'call/me' => 'call_me#create'
  get 'callme' => 'call_me#callme'
  get 'me' => 'call_me#callme'

  get 'challenge_users', to: 'users#index'
  post 'challenge_users', to: 'users#create'
  patch 'challenge_users', to: 'users#update'
  put 'challenge_users', to: 'users#update'
  get 'challenge_users/token/:token', to: 'users#token'

  match '*path', to: 'application#not_this_way', via: :all
end

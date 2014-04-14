StackOverflowClone::Application.routes.draw do
  root to: 'users#index'
  resources :sessions
  resources :users
  resources :questions
  resources :answers
  resources :votes
end

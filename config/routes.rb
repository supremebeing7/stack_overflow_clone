StackOverflowClone::Application.routes.draw do
  root to: 'questions#index'
  resources :sessions
  resources :users
  resources :questions
  resources :answers
  resources :votes
end

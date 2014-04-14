StackOverflowClone::Application.routes.draw do
  root to: 'questions#index'
  resources :sessions
  resources :users
  resources :questions do
    resources :answers
  end
  resources :votes
end

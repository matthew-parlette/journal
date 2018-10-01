Rails.application.routes.draw do
  get 'home/index'

  get 'home/today'

  resources :notes
  resources :events
  resources :tasks
  resources :categories do
    resources :tasks
    resources :events
    resources :notes
    get :today, on: :member
  end
  devise_for :users
  get 'welcome/index'

  get 'welcome/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

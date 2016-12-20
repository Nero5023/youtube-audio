Rails.application.routes.draw do
  get 'search/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :audios
  root 'search#index'
end

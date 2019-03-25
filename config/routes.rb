Rails.application.routes.draw do
  namespace :navegar do
    get 'index'
  end

  namespace :admin do
    get 'index'
   end
  namespace :about do
    get 'index'
  end
  resources :students, only: [:edit,:new, :show, :index]

  get 'welcome/index'
  root to:  'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
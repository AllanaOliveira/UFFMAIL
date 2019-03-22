Rails.application.routes.draw do
  namespace :admin do
    get 'index'
   end
  namespace :about do
    get 'index'
  end
  namespace :student do
    get 'index'
    resources only: [:index, :edit, :new]
  end

  get 'welcome/index'
  root to:  'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :menus, only: %i[index show create destroy] do
    resources :menus_products, only: %i[index create destroy]
  end
  resources :categories
  resources :products


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'line_item_dates/new'
  root to: 'pages#home'
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do
      resources :line_items, except: [:index, :show]
    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root 'pronounceables#index'

  resources :pronounceables do
    resources :pronunciations, only: [:new, :create]
  end

  scope '/admin' do
    resources :management, only: [:index]
    resources :abuse_report_reasons, except: [:destroy]
    resources :abuse_report_statuses, except: [:destroy]
    resources :abuse_reports, only: [:index, :create, :show] do
      member do
        post :acknowledge
        post :dismiss
      end
    end
    resources :users, only: [:index]
  end
end

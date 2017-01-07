Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pronounceables#index'

  resources :pronounceables do
    resources :pronunciations, only: [:new, :create]
  end

  resources :abuse_report_reasons, except: [:destroy]
  resources :abuse_report_statuses, except: [:destroy]
  resources :abuse_reports
end

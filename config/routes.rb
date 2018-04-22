Rails.application.routes.draw do
  resources :users do
    collection do
      post 'login'
    end
    member do
      put 'desactivate'
      put 'activate'
      get 'payments/:payment_id', action: :get_payments
      post 'payments'
    end
  end
end

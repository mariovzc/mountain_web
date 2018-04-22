Rails.application.routes.draw do
  resources :users do
    collection do
      post 'login'
    end
    member do
      put 'desactivate'
      put 'activate'
    end
  end
end

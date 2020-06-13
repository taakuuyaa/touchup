Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require Rails.root.join('lib', 'subdomain.rb')

  constraints subdomain: 'app' do
    # テナント作成用
    # resources :tenant, only: [:new, :create]

    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end

    constraints ExcludedSubdomainConstraint do
      root to: "home#index"
      resources :video, only: [:index, :new, :create]
    end
  end
end

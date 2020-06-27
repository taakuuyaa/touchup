Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require Rails.root.join('lib', 'subdomain.rb')
  # ELBヘルスチェック用
  get 'health' => 'health_check#health'

  constraints ExcludedSubdomainConstraint do
    root to: redirect('/movie')

    # ログイン関連
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    # 動画
    get 'movie' => 'videos#index'
    get 'movie/add' => 'videos#new'
    post 'movie' => 'videos#create'
    delete 'movie' => 'videos#destroy'
  end
end

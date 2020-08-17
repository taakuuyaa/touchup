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
    resources :movies, only: [:index, :new, :create, :destroy], controller: 'videos'
    # 動画ステータス変更
    put 'movie/:id/status' => 'videos#change_status'
  end
end

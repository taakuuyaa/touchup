Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require Rails.root.join('lib', 'subdomain.rb')

  constraints Subdomain do # サブドメインが指定されていた場合に以下のルーティングが利用される

    # サブドメインが「app」のときのルーティング
    constraints subdomain: 'app' do
    end

  end
end

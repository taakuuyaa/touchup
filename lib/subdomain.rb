# サブドメインルーティングに関する処理
class Subdomain
  def self.matches?(request)
    # wwwの場合は追加するルーティングにマッチングしないようにしておく
    request.subdomain.present? && request.subdomain != 'www'
  end
end

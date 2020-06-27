# サブドメインルーティングに関する処理
class ExcludedSubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? && !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)
  end
end

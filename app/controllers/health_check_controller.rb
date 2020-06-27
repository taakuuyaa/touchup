class HealthCheckController < ApplicationController
  def health
    render plain:'ok'
  end
end

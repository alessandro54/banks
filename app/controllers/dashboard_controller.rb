class DashboardController < ApplicationController
  def index
    @providers_count = Provider.count
  end
end

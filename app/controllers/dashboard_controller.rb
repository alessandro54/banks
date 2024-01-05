class DashboardController < BaseController
  def index
    @providers_count = Provider.count
    @banks_count = Bank.count
  end
end

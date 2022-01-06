class DashboardController < ApplicationController
  def index
    @first_graph = Sale.last_months(12).group(:date).order(date: :asc).sum(:price)
  end
end

class DashboardController < ApplicationController
  def index
    # @first_graph = Sale.last_months(12).group(:date).order(date: :asc).sum(:price)
    @first_data = Sale.last_months(12).group_by_month_of_year(:date).sum(:price)
    @first_graph = {}
    @first_data.each do |month,value|
      @first_graph[Date::MONTHNAMES[month]] = value
    end

    @second_data = Sale.last_months(12).group_by_month_of_year(:date).sum(:quantity)
    @second_graph = {}
    @second_data.each do |month,value|
      @second_graph[Date::MONTHNAMES[month]] = value
    end

    @venta_promedio = {}
    @second_graph.each do |key,value|
      @venta_promedio[key] = @first_graph[key] / @second_graph[key]
    end

    @consolidado = []

    @consolidado.push ({name: "Amounts", data: @second_graph})
    @consolidado.push ({name: "average", data:@venta_promedio})
  end
end

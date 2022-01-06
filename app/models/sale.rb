class Sale < ApplicationRecord
  belongs_to :product

  def self.last_months(x)
    start =  x.months.ago.beginning_of_month
    finish_date = (start + (x-1).month).end_of_month
    self.where("date BETWEEN ? AND ?", start , finish_date )
  end
end

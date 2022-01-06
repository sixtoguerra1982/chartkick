class Sale < ApplicationRecord
  belongs_to :product

  def self.last_months(x)
    self.where("date < ?", x.months.ago)
  end
end

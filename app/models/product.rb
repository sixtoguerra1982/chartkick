class Product < ApplicationRecord
    has_many :sales
    validates :name, presence: true
    validates :origin, presence: true
    validates :variety, presence: true
    # :unit_price >= 1990 && :unit_price <= 5490 
    # before_save: :value_unit_price
     
    # def value_unit_price
    #   self.
    # end
    validates :unit_price, numericality: { greater_than_or_equal_to: 1990 } 
    validates :unit_price, numericality: { less_than_or_equal_to: 5490 } 
end

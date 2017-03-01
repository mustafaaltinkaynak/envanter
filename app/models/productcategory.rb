class Productcategory < ApplicationRecord
  belongs_to :maincategory
  belongs_to :subcategory
  belongs_to :product
end

class Person < ApplicationRecord
  belongs_to :department
  has_many :products
end

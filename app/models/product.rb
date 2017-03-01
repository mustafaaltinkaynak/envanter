class Product < ApplicationRecord
  belongs_to :company
  belongs_to :mark
  belongs_to :person
  has_many :productcategory, dependent: :destroy
  validates :title, presence: true

  attr_accessor :maincategory_id
  attr_accessor :subcategory_id

  after_create  :create_productcategory
  after_save    :update_productcategory

  def create_productcategory
    product = Product.last
    _ = Productcategory.new do |pc|
      pc.maincategory_id  = maincategory_id
      pc.subcategory_id   = subcategory_id
      pc.product_id       = product.id
      pc.save!
    end

    product.productcategory_id = Productcategory.last.id
    product.save!
  end

  def update_productcategory
    productcategory = Product.find(id).productcategory.first
    productcategory.maincategory_id = maincategory_id
    productcategory.subcategory_id  = subcategory_id
    productcategory.save!
  end

  ransacker :by_maincategory,
            formatter: proc { |v|
              product_ids = Product.where(
                id: Productcategory.where(maincategory_id: v).pluck(:product_id)
              ).pluck(:id)
              product_ids.any? ? product_ids : nil
            } do |parent|
    parent.table[:id]
  end

  ransacker :by_subcategory,
            formatter: proc { |v|
              product_ids = Product.where(
                id: Productcategory.where(subcategory_id: v).pluck(:product_id)
              ).pluck(:id)
              product_ids.any? ? product_ids : nil
            } do |parent|
    parent.table[:id]
  end
end

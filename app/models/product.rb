# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  icon       :string
#  name       :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stand_id   :bigint           not null
#
# Indexes
#
#  index_products_on_stand_id  (stand_id)
#
# Foreign Keys
#
#  fk_rails_...  (stand_id => stands.id)
#
class Product < ApplicationRecord
  belongs_to :stand
  has_many :purchased_products
  has_many :purchases, through: :purchased_products

  include Iconed

  def times_sold
    purchased_products.map(&:amount).sum
  end

  def total_sales
    times_sold * price
  end

  def self.total_number_sales
    Product.all.map(&:times_sold).sum
  end

  def self.total_value_sales
    Product.all.map(&:total_sales).sum
  end
end

# == Schema Information
#
# Table name: stands
#
#  id          :bigint           not null, primary key
#  icon        :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  operator_id :bigint
#
# Indexes
#
#  index_stands_on_operator_id  (operator_id)
#
# Foreign Keys
#
#  fk_rails_...  (operator_id => users.id)
#
class Stand < ApplicationRecord
  belongs_to :operator, class_name: :User, foreign_key: :operator_id
  has_many :purchases, dependent: :destroy
  has_many :products, dependent: :destroy
  has_and_belongs_to_many :users

  include Iconed

  def number_products_sold
    products.map(&:times_sold).sum
  end

  def value_products_sold
    products.map(&:total_sales).sum
  end

  def self.with_products
    Stand.all.reject { |s| s.products.empty? }
  end

  def self.with_products_grouped
    all = []
    Stand.with_products.each do |s|
      products = s.products.map { |p| [p.icon_and_name, p.id] }
      all << [s.name, products]
    end
    all
  end
end

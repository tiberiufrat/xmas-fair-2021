# == Schema Information
#
# Table name: purchases
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  operator_id :bigint           not null
#  stand_id    :bigint           not null
#
# Indexes
#
#  index_purchases_on_operator_id  (operator_id)
#  index_purchases_on_stand_id     (stand_id)
#
# Foreign Keys
#
#  fk_rails_...  (operator_id => users.id)
#  fk_rails_...  (stand_id => stands.id)
#
class Purchase < ApplicationRecord
  belongs_to :operator, class_name: :User, foreign_key: :operator_id
  belongs_to :stand
  has_many :purchased_products, inverse_of: :purchase, dependent: :destroy
  has_many :products, through: :purchased_products

  accepts_nested_attributes_for :purchased_products, allow_destroy: true, reject_if: :all_blank

  include Iconed

  def self.today
    Purchase.all.filter { |p| p.created_at.to_date.today? }
  end

  def self.total_sales
    Purchase.all.map(&:price).reduce(:+)
  end

  def price
    price = 0
    purchased_products.each do |pp|
      price += pp.total_price
    end
    price
  end

  def products_number
    purchased_products.map(&:amount).reduce(:+)
  end
end

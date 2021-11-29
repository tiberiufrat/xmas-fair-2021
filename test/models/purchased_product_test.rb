# == Schema Information
#
# Table name: purchased_products
#
#  id          :bigint           not null, primary key
#  amount      :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#  purchase_id :bigint
#
# Indexes
#
#  index_purchased_products_on_product_id   (product_id)
#  index_purchased_products_on_purchase_id  (purchase_id)
#
require "test_helper"

class PurchasedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

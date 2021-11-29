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
require "test_helper"

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

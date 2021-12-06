# == Schema Information
#
# Table name: spiridon_purchases
#
#  id          :bigint           not null, primary key
#  amount      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  operator_id :bigint           not null
#
# Indexes
#
#  index_spiridon_purchases_on_operator_id  (operator_id)
#
# Foreign Keys
#
#  fk_rails_...  (operator_id => users.id)
#
require "test_helper"

class SpiridonPurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

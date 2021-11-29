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
require "test_helper"

class StandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

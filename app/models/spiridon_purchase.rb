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
class SpiridonPurchase < ApplicationRecord
  belongs_to :operator, class_name: :User, foreign_key: :operator_id

  def self.today
    SpiridonPurchase.all.filter { |sp| sp.created_at.to_date.today? }
  end
end

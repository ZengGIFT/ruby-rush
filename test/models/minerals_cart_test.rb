# == Schema Information
#
# Table name: minerals_carts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  rubies_incart :integer          default(0)
#  aasm_state    :string           default("new_cart")
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class MineralsCartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

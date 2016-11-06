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

class MineralsCart < ApplicationRecord
  has_many :minerals

  include AASM

  aasm do
    state :new_cart, initial: true
    state :cart_of_minerals
    state :cart_of_rubies

    event :dig_minerals do
      transitions from: [:new_cart, :cart_of_rubies], to: :cart_of_minerals
    end

    event :select_mineral do
      transitions from: :cart_of_minerals, to: :cart_of_rubies
    end
  end

end

# == Schema Information
#
# Table name: minerals
#
#  id                    :integer          not null, primary key
#  minerals_cart_id      :integer
#  rubies_inside_mineral :integer
#  title                 :string           default("")
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Mineral < ApplicationRecord
  belongs_to :minerals_cart
end

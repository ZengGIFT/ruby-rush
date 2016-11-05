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

  def self.get_nine_new_minerals
    # if current_mcart.minerals.present?
    #   # Mineral.delete_all
    # end

    m = self.create
    m.minerals_cart_id = 42
    m.save

  end
end

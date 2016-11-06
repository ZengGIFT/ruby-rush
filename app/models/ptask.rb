# == Schema Information
#
# Table name: ptasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  reward      :integer
#  is_hidden   :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ptask < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :reward, presence: true

end

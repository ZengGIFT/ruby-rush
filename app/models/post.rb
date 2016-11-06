# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  total_rubies :integer          default(0)
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :title, presence: true

end

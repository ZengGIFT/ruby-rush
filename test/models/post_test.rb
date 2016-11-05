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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

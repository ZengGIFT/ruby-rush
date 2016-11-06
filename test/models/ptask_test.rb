# == Schema Information
#
# Table name: ptasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  is_actived  :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PtaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

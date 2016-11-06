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

require 'test_helper'

class PtaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

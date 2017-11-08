# == Schema Information
#
# Table name: consults
#
#  id              :integer          not null, primary key
#  turno_id        :integer
#  tipo_consult_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ConsultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

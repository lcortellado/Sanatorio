# == Schema Information
#
# Table name: internaciones
#
#  id             :integer          not null, primary key
#  fechaIng       :date
#  horaIng        :time
#  fechaSalida    :date
#  horaSalida     :time
#  habitacione_id :integer
#  paciente_id    :integer
#  medico_id      :integer
#  totalGasto     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class InternacioneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

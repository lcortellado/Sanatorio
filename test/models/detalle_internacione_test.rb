# == Schema Information
#
# Table name: detalle_internaciones
#
#  id              :integer          not null, primary key
#  descripcion     :string(255)
#  cantidad        :string(255)
#  preciouni       :integer
#  subtotal        :integer
#  fecha           :date
#  hora            :time
#  internacione_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class DetalleInternacioneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

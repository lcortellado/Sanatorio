# == Schema Information
#
# Table name: unidades_medidas
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UnidadesMedida < ApplicationRecord
    has_many :insumos
end

# == Schema Information
#
# Table name: tipo_ivas
#
#  id         :integer          not null, primary key
#  decripcion :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TipoIva < ApplicationRecord
    has_many :insumos
end

# == Schema Information
#
# Table name: tipo_consults
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TipoConsult < ApplicationRecord
    has_many :consuls
end

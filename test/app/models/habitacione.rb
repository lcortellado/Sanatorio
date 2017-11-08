# == Schema Information
#
# Table name: habitaciones
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  nrohabit    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Habitacione < ApplicationRecord
    has_many :internaciones
end

# == Schema Information
#
# Table name: tipos
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tipo < ApplicationRecord
end

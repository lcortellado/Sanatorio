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

class Consult < ApplicationRecord
  belongs_to :turno
  belongs_to :tipo_consult

end

# == Schema Information
#
# Table name: formas_pagos
#
#  id          :integer          not null, primary key
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FormasPago < ApplicationRecord
	has_many :factproveedores
	has_many :sales
    has_many :ventas
end

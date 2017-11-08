class ValidateSuggestedInsumoController < ApplicationController
 def index
  insumo = []
  if params[:insumo_descripcion].present?
   insumo_descripcion = params[:insumo_descripcion]
   condition = "unaccent(lower(descripcion)) = '#{I18n.transliterate(insumo_descripcion.downcase)}'"
   insumo = Insumo.where(condition)
  end
  if !insumo.empty?
   result = [valid: true, id: insumo.ids]
  else
   result = [valid: false, id: 0]
  end
  render json: result
 end
end
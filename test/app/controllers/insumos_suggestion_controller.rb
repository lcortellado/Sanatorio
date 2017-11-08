class InsumosSuggestionController < ApplicationController
 def index
  if params[:query].present?
   query = params[:query]
   condition = "unaccent(lower(descripcion)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
   @insumos = Insumo.where(condition)
  end
  @insumos ||= Insumo.none

  render json: @insumos
 end
end
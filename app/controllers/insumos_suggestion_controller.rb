class InsumosSuggestionController < ApplicationController
 def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(insumo.descripcion)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			condition2 = condition1 + " OR unaccent(lower(brands.name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@items = Item.joins(:brand).where(condition2)
			@insumos.each do |insumo|
				insumo.descripcion = insumo.insumo_descripcion
			end
		end
		@insumos ||= Insumo.none

		render json: @insumos
	end
end
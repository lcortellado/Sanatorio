class TipoIvasSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition = "unaccent(lower(descripcion)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@tipo_ivas = TipoIva.where(condition)
		end
		@tipo_ivas ||= TipoIva.none

		render json: @tipo_ivas
	end
end
class AdminsController < ApplicationController
  private

    def admin_params
      params.require(:admin).permit()
    end
    
    def index
    @especialidades = Especialidade.all
    end
end

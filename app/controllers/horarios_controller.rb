class HorariosController < InheritedResources::Base

  private

    def horario_params
      params.require(:horario).permit(:codigo, :medico_id, :dia_id, :horadesde, :horahasta, :fecha)
    end
end


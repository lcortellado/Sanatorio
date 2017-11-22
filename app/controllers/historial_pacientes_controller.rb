class HistorialPacientesController < InheritedResources::Base

  private

    def historial_paciente_params
      params.require(:historial_paciente).permit(:codigo, :diagnostico, :indicaciones, :reserva_id, :estudios, :resultestudios, :fecha_proxima_cita, :recomendaciones, :precio, :descuento, :total)
    end
end


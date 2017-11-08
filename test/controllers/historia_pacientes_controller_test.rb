require 'test_helper'

class HistoriaPacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historia_paciente = historia_pacientes(:one)
  end

  test "should get index" do
    get historia_pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_historia_paciente_url
    assert_response :success
  end

  test "should create historia_paciente" do
    assert_difference('HistoriaPaciente.count') do
      post historia_pacientes_url, params: { historia_paciente: { diagnostico: @historia_paciente.diagnostico, fecha_proxima_cita: @historia_paciente.fecha_proxima_cita, indicaciones: @historia_paciente.indicaciones, recomendaciones: @historia_paciente.recomendaciones, reserva_id: @historia_paciente.reserva_id } }
    end

    assert_redirected_to historia_paciente_url(HistoriaPaciente.last)
  end

  test "should show historia_paciente" do
    get historia_paciente_url(@historia_paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_historia_paciente_url(@historia_paciente)
    assert_response :success
  end

  test "should update historia_paciente" do
    patch historia_paciente_url(@historia_paciente), params: { historia_paciente: { diagnostico: @historia_paciente.diagnostico, fecha_proxima_cita: @historia_paciente.fecha_proxima_cita, indicaciones: @historia_paciente.indicaciones, recomendaciones: @historia_paciente.recomendaciones, reserva_id: @historia_paciente.reserva_id } }
    assert_redirected_to historia_paciente_url(@historia_paciente)
  end

  test "should destroy historia_paciente" do
    assert_difference('HistoriaPaciente.count', -1) do
      delete historia_paciente_url(@historia_paciente)
    end

    assert_redirected_to historia_pacientes_url
  end
end

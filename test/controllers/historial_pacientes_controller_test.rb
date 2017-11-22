require 'test_helper'

class HistorialPacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historial_paciente = historial_pacientes(:one)
  end

  test "should get index" do
    get historial_pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_historial_paciente_url
    assert_response :success
  end

  test "should create historial_paciente" do
    assert_difference('HistorialPaciente.count') do
      post historial_pacientes_url, params: { historial_paciente: { codigo: @historial_paciente.codigo, descuento: @historial_paciente.descuento, diagnostico: @historial_paciente.diagnostico, estudios: @historial_paciente.estudios, fecha_proxima_cita: @historial_paciente.fecha_proxima_cita, indicaciones: @historial_paciente.indicaciones, precio: @historial_paciente.precio, recomendaciones: @historial_paciente.recomendaciones, reserva_id: @historial_paciente.reserva_id, resultestudios: @historial_paciente.resultestudios, total: @historial_paciente.total } }
    end

    assert_redirected_to historial_paciente_url(HistorialPaciente.last)
  end

  test "should show historial_paciente" do
    get historial_paciente_url(@historial_paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_historial_paciente_url(@historial_paciente)
    assert_response :success
  end

  test "should update historial_paciente" do
    patch historial_paciente_url(@historial_paciente), params: { historial_paciente: { codigo: @historial_paciente.codigo, descuento: @historial_paciente.descuento, diagnostico: @historial_paciente.diagnostico, estudios: @historial_paciente.estudios, fecha_proxima_cita: @historial_paciente.fecha_proxima_cita, indicaciones: @historial_paciente.indicaciones, precio: @historial_paciente.precio, recomendaciones: @historial_paciente.recomendaciones, reserva_id: @historial_paciente.reserva_id, resultestudios: @historial_paciente.resultestudios, total: @historial_paciente.total } }
    assert_redirected_to historial_paciente_url(@historial_paciente)
  end

  test "should destroy historial_paciente" do
    assert_difference('HistorialPaciente.count', -1) do
      delete historial_paciente_url(@historial_paciente)
    end

    assert_redirected_to historial_pacientes_url
  end
end

require 'test_helper'

class HistoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historia = historias(:one)
  end

  test "should get index" do
    get historias_url
    assert_response :success
  end

  test "should get new" do
    get new_historia_url
    assert_response :success
  end

  test "should create historia" do
    assert_difference('Historia.count') do
      post historias_url, params: { historia: { codigo: @historia.codigo, descuento: @historia.descuento, diagnostico: @historia.diagnostico, estudios: @historia.estudios, fecha_proxima_cita: @historia.fecha_proxima_cita, indicaciones: @historia.indicaciones, precio: @historia.precio, recomendaciones: @historia.recomendaciones, reserva_id: @historia.reserva_id, resultestudios: @historia.resultestudios, total: @historia.total } }
    end

    assert_redirected_to historia_url(Historia.last)
  end

  test "should show historia" do
    get historia_url(@historia)
    assert_response :success
  end

  test "should get edit" do
    get edit_historia_url(@historia)
    assert_response :success
  end

  test "should update historia" do
    patch historia_url(@historia), params: { historia: { codigo: @historia.codigo, descuento: @historia.descuento, diagnostico: @historia.diagnostico, estudios: @historia.estudios, fecha_proxima_cita: @historia.fecha_proxima_cita, indicaciones: @historia.indicaciones, precio: @historia.precio, recomendaciones: @historia.recomendaciones, reserva_id: @historia.reserva_id, resultestudios: @historia.resultestudios, total: @historia.total } }
    assert_redirected_to historia_url(@historia)
  end

  test "should destroy historia" do
    assert_difference('Historia.count', -1) do
      delete historia_url(@historia)
    end

    assert_redirected_to historias_url
  end
end

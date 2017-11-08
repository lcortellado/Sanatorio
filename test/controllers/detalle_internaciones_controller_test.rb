require 'test_helper'

class DetalleInternacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_internacione = detalle_internaciones(:one)
  end

  test "should get index" do
    get detalle_internaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_internacione_url
    assert_response :success
  end

  test "should create detalle_internacione" do
    assert_difference('DetalleInternacione.count') do
      post detalle_internaciones_url, params: { detalle_internacione: { cantidad: @detalle_internacione.cantidad, descripcion: @detalle_internacione.descripcion, fecha: @detalle_internacione.fecha, hora: @detalle_internacione.hora, internacione_id: @detalle_internacione.internacione_id, preciouni: @detalle_internacione.preciouni, subtotal: @detalle_internacione.subtotal } }
    end

    assert_redirected_to detalle_internacione_url(DetalleInternacione.last)
  end

  test "should show detalle_internacione" do
    get detalle_internacione_url(@detalle_internacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_internacione_url(@detalle_internacione)
    assert_response :success
  end

  test "should update detalle_internacione" do
    patch detalle_internacione_url(@detalle_internacione), params: { detalle_internacione: { cantidad: @detalle_internacione.cantidad, descripcion: @detalle_internacione.descripcion, fecha: @detalle_internacione.fecha, hora: @detalle_internacione.hora, internacione_id: @detalle_internacione.internacione_id, preciouni: @detalle_internacione.preciouni, subtotal: @detalle_internacione.subtotal } }
    assert_redirected_to detalle_internacione_url(@detalle_internacione)
  end

  test "should destroy detalle_internacione" do
    assert_difference('DetalleInternacione.count', -1) do
      delete detalle_internacione_url(@detalle_internacione)
    end

    assert_redirected_to detalle_internaciones_url
  end
end

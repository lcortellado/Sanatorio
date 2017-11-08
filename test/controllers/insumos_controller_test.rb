require 'test_helper'

class InsumosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insumo = insumos(:one)
  end

  test "should get index" do
    get insumos_url
    assert_response :success
  end

  test "should get new" do
    get new_insumo_url
    assert_response :success
  end

  test "should create insumo" do
    assert_difference('Insumo.count') do
      post insumos_url, params: { insumo: { descripcion: @insumo.descripcion, precio_compra: @insumo.precio_compra, precio_venta: @insumo.precio_venta, proveedore_id: @insumo.proveedore_id, stock: @insumo.stock, stock_minimo: @insumo.stock_minimo, tipo_iva_id: @insumo.tipo_iva_id, unidades_medida_id: @insumo.unidades_medida_id } }
    end

    assert_redirected_to insumo_url(Insumo.last)
  end

  test "should show insumo" do
    get insumo_url(@insumo)
    assert_response :success
  end

  test "should get edit" do
    get edit_insumo_url(@insumo)
    assert_response :success
  end

  test "should update insumo" do
    patch insumo_url(@insumo), params: { insumo: { descripcion: @insumo.descripcion, precio_compra: @insumo.precio_compra, precio_venta: @insumo.precio_venta, proveedore_id: @insumo.proveedore_id, stock: @insumo.stock, stock_minimo: @insumo.stock_minimo, tipo_iva_id: @insumo.tipo_iva_id, unidades_medida_id: @insumo.unidades_medida_id } }
    assert_redirected_to insumo_url(@insumo)
  end

  test "should destroy insumo" do
    assert_difference('Insumo.count', -1) do
      delete insumo_url(@insumo)
    end

    assert_redirected_to insumos_url
  end
end

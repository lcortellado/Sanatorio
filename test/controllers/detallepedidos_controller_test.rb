require 'test_helper'

class DetallepedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detallepedido = detallepedidos(:one)
  end

  test "should get index" do
    get detallepedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_detallepedido_url
    assert_response :success
  end

  test "should create detallepedido" do
    assert_difference('Detallepedido.count') do
      post detallepedidos_url, params: { detallepedido: { insumo_id: @detallepedido.insumo_id, pedido_id: @detallepedido.pedido_id, solicitado: @detallepedido.solicitado, surtido: @detallepedido.surtido } }
    end

    assert_redirected_to detallepedido_url(Detallepedido.last)
  end

  test "should show detallepedido" do
    get detallepedido_url(@detallepedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_detallepedido_url(@detallepedido)
    assert_response :success
  end

  test "should update detallepedido" do
    patch detallepedido_url(@detallepedido), params: { detallepedido: { insumo_id: @detallepedido.insumo_id, pedido_id: @detallepedido.pedido_id, solicitado: @detallepedido.solicitado, surtido: @detallepedido.surtido } }
    assert_redirected_to detallepedido_url(@detallepedido)
  end

  test "should destroy detallepedido" do
    assert_difference('Detallepedido.count', -1) do
      delete detallepedido_url(@detallepedido)
    end

    assert_redirected_to detallepedidos_url
  end
end

require 'test_helper'

class DellePedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delle_pedido = delle_pedidos(:one)
  end

  test "should get index" do
    get delle_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_delle_pedido_url
    assert_response :success
  end

  test "should create delle_pedido" do
    assert_difference('DellePedido.count') do
      post delle_pedidos_url, params: { delle_pedido: { cantidad: @delle_pedido.cantidad, insumo_id: @delle_pedido.insumo_id, pedido_id: @delle_pedido.pedido_id } }
    end

    assert_redirected_to delle_pedido_url(DellePedido.last)
  end

  test "should show delle_pedido" do
    get delle_pedido_url(@delle_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_delle_pedido_url(@delle_pedido)
    assert_response :success
  end

  test "should update delle_pedido" do
    patch delle_pedido_url(@delle_pedido), params: { delle_pedido: { cantidad: @delle_pedido.cantidad, insumo_id: @delle_pedido.insumo_id, pedido_id: @delle_pedido.pedido_id } }
    assert_redirected_to delle_pedido_url(@delle_pedido)
  end

  test "should destroy delle_pedido" do
    assert_difference('DellePedido.count', -1) do
      delete delle_pedido_url(@delle_pedido)
    end

    assert_redirected_to delle_pedidos_url
  end
end

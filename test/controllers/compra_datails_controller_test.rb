require 'test_helper'

class CompraDatailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compra_datail = compra_datails(:one)
  end

  test "should get index" do
    get compra_datails_url
    assert_response :success
  end

  test "should get new" do
    get new_compra_datail_url
    assert_response :success
  end

  test "should create compra_datail" do
    assert_difference('CompraDatail.count') do
      post compra_datails_url, params: { compra_datail: { compra_id: @compra_datail.compra_id, insumo_id: @compra_datail.insumo_id, number: @compra_datail.number, price: @compra_datail.price, qty: @compra_datail.qty } }
    end

    assert_redirected_to compra_datail_url(CompraDatail.last)
  end

  test "should show compra_datail" do
    get compra_datail_url(@compra_datail)
    assert_response :success
  end

  test "should get edit" do
    get edit_compra_datail_url(@compra_datail)
    assert_response :success
  end

  test "should update compra_datail" do
    patch compra_datail_url(@compra_datail), params: { compra_datail: { compra_id: @compra_datail.compra_id, insumo_id: @compra_datail.insumo_id, number: @compra_datail.number, price: @compra_datail.price, qty: @compra_datail.qty } }
    assert_redirected_to compra_datail_url(@compra_datail)
  end

  test "should destroy compra_datail" do
    assert_difference('CompraDatail.count', -1) do
      delete compra_datail_url(@compra_datail)
    end

    assert_redirected_to compra_datails_url
  end
end

require 'test_helper'

class VentaDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venta_detail = venta_details(:one)
  end

  test "should get index" do
    get venta_details_url
    assert_response :success
  end

  test "should get new" do
    get new_venta_detail_url
    assert_response :success
  end

  test "should create venta_detail" do
    assert_difference('VentaDetail.count') do
      post venta_details_url, params: { venta_detail: { insumo_id: @venta_detail.insumo_id, number: @venta_detail.number, price: @venta_detail.price, qty: @venta_detail.qty, venta_id: @venta_detail.venta_id } }
    end

    assert_redirected_to venta_detail_url(VentaDetail.last)
  end

  test "should show venta_detail" do
    get venta_detail_url(@venta_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_venta_detail_url(@venta_detail)
    assert_response :success
  end

  test "should update venta_detail" do
    patch venta_detail_url(@venta_detail), params: { venta_detail: { insumo_id: @venta_detail.insumo_id, number: @venta_detail.number, price: @venta_detail.price, qty: @venta_detail.qty, venta_id: @venta_detail.venta_id } }
    assert_redirected_to venta_detail_url(@venta_detail)
  end

  test "should destroy venta_detail" do
    assert_difference('VentaDetail.count', -1) do
      delete venta_detail_url(@venta_detail)
    end

    assert_redirected_to venta_details_url
  end
end

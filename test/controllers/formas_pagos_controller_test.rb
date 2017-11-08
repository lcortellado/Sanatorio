require 'test_helper'

class FormasPagosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formas_pago = formas_pagos(:one)
  end

  test "should get index" do
    get formas_pagos_url
    assert_response :success
  end

  test "should get new" do
    get new_formas_pago_url
    assert_response :success
  end

  test "should create formas_pago" do
    assert_difference('FormasPago.count') do
      post formas_pagos_url, params: { formas_pago: { descripcion: @formas_pago.descripcion } }
    end

    assert_redirected_to formas_pago_url(FormasPago.last)
  end

  test "should show formas_pago" do
    get formas_pago_url(@formas_pago)
    assert_response :success
  end

  test "should get edit" do
    get edit_formas_pago_url(@formas_pago)
    assert_response :success
  end

  test "should update formas_pago" do
    patch formas_pago_url(@formas_pago), params: { formas_pago: { descripcion: @formas_pago.descripcion } }
    assert_redirected_to formas_pago_url(@formas_pago)
  end

  test "should destroy formas_pago" do
    assert_difference('FormasPago.count', -1) do
      delete formas_pago_url(@formas_pago)
    end

    assert_redirected_to formas_pagos_url
  end
end

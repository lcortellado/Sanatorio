require 'test_helper'

class DetallefactproveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detallefactproveedore = detallefactproveedores(:one)
  end

  test "should get index" do
    get detallefactproveedores_url
    assert_response :success
  end

  test "should get new" do
    get new_detallefactproveedore_url
    assert_response :success
  end

  test "should create detallefactproveedore" do
    assert_difference('Detallefactproveedore.count') do
      post detallefactproveedores_url, params: { detallefactproveedore: { cantidad: @detallefactproveedore.cantidad, factproveedores_id: @detallefactproveedore.factproveedores_id, insumo_id: @detallefactproveedore.insumo_id, number: @detallefactproveedore.number, precio: @detallefactproveedore.precio } }
    end

    assert_redirected_to detallefactproveedore_url(Detallefactproveedore.last)
  end

  test "should show detallefactproveedore" do
    get detallefactproveedore_url(@detallefactproveedore)
    assert_response :success
  end

  test "should get edit" do
    get edit_detallefactproveedore_url(@detallefactproveedore)
    assert_response :success
  end

  test "should update detallefactproveedore" do
    patch detallefactproveedore_url(@detallefactproveedore), params: { detallefactproveedore: { cantidad: @detallefactproveedore.cantidad, factproveedores_id: @detallefactproveedore.factproveedores_id, insumo_id: @detallefactproveedore.insumo_id, number: @detallefactproveedore.number, precio: @detallefactproveedore.precio } }
    assert_redirected_to detallefactproveedore_url(@detallefactproveedore)
  end

  test "should destroy detallefactproveedore" do
    assert_difference('Detallefactproveedore.count', -1) do
      delete detallefactproveedore_url(@detallefactproveedore)
    end

    assert_redirected_to detallefactproveedores_url
  end
end

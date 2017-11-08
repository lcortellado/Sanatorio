require 'test_helper'

class FactproveedoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @factproveedore = factproveedores(:one)
  end

  test "should get index" do
    get factproveedores_url
    assert_response :success
  end

  test "should get new" do
    get new_factproveedore_url
    assert_response :success
  end

  test "should create factproveedore" do
    assert_difference('Factproveedore.count') do
      post factproveedores_url, params: { factproveedore: { codigo: @factproveedore.codigo, pedido_id: @factproveedore.pedido_id, sanatorio_id: @factproveedore.sanatorio_id, usuario_id: @factproveedore.usuario_id } }
    end

    assert_redirected_to factproveedore_url(Factproveedore.last)
  end

  test "should show factproveedore" do
    get factproveedore_url(@factproveedore)
    assert_response :success
  end

  test "should get edit" do
    get edit_factproveedore_url(@factproveedore)
    assert_response :success
  end

  test "should update factproveedore" do
    patch factproveedore_url(@factproveedore), params: { factproveedore: { codigo: @factproveedore.codigo, pedido_id: @factproveedore.pedido_id, sanatorio_id: @factproveedore.sanatorio_id, usuario_id: @factproveedore.usuario_id } }
    assert_redirected_to factproveedore_url(@factproveedore)
  end

  test "should destroy factproveedore" do
    assert_difference('Factproveedore.count', -1) do
      delete factproveedore_url(@factproveedore)
    end

    assert_redirected_to factproveedores_url
  end
end

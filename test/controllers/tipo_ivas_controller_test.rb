require 'test_helper'

class TipoIvasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_iva = tipo_ivas(:one)
  end

  test "should get index" do
    get tipo_ivas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_iva_url
    assert_response :success
  end

  test "should create tipo_iva" do
    assert_difference('TipoIva.count') do
      post tipo_ivas_url, params: { tipo_iva: { decripcion: @tipo_iva.decripcion } }
    end

    assert_redirected_to tipo_iva_url(TipoIva.last)
  end

  test "should show tipo_iva" do
    get tipo_iva_url(@tipo_iva)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_iva_url(@tipo_iva)
    assert_response :success
  end

  test "should update tipo_iva" do
    patch tipo_iva_url(@tipo_iva), params: { tipo_iva: { decripcion: @tipo_iva.decripcion } }
    assert_redirected_to tipo_iva_url(@tipo_iva)
  end

  test "should destroy tipo_iva" do
    assert_difference('TipoIva.count', -1) do
      delete tipo_iva_url(@tipo_iva)
    end

    assert_redirected_to tipo_ivas_url
  end
end

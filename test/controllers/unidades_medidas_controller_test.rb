require 'test_helper'

class UnidadesMedidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidades_medida = unidades_medidas(:one)
  end

  test "should get index" do
    get unidades_medidas_url
    assert_response :success
  end

  test "should get new" do
    get new_unidades_medida_url
    assert_response :success
  end

  test "should create unidades_medida" do
    assert_difference('UnidadesMedida.count') do
      post unidades_medidas_url, params: { unidades_medida: { descripcion: @unidades_medida.descripcion } }
    end

    assert_redirected_to unidades_medida_url(UnidadesMedida.last)
  end

  test "should show unidades_medida" do
    get unidades_medida_url(@unidades_medida)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidades_medida_url(@unidades_medida)
    assert_response :success
  end

  test "should update unidades_medida" do
    patch unidades_medida_url(@unidades_medida), params: { unidades_medida: { descripcion: @unidades_medida.descripcion } }
    assert_redirected_to unidades_medida_url(@unidades_medida)
  end

  test "should destroy unidades_medida" do
    assert_difference('UnidadesMedida.count', -1) do
      delete unidades_medida_url(@unidades_medida)
    end

    assert_redirected_to unidades_medidas_url
  end
end

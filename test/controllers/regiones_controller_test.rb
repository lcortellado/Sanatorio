require 'test_helper'

class RegionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regione = regiones(:one)
  end

  test "should get index" do
    get regiones_url
    assert_response :success
  end

  test "should get new" do
    get new_regione_url
    assert_response :success
  end

  test "should create regione" do
    assert_difference('Regione.count') do
      post regiones_url, params: { regione: { codigo: @regione.codigo, nombre: @regione.nombre } }
    end

    assert_redirected_to regione_url(Regione.last)
  end

  test "should show regione" do
    get regione_url(@regione)
    assert_response :success
  end

  test "should get edit" do
    get edit_regione_url(@regione)
    assert_response :success
  end

  test "should update regione" do
    patch regione_url(@regione), params: { regione: { codigo: @regione.codigo, nombre: @regione.nombre } }
    assert_redirected_to regione_url(@regione)
  end

  test "should destroy regione" do
    assert_difference('Regione.count', -1) do
      delete regione_url(@regione)
    end

    assert_redirected_to regiones_url
  end
end

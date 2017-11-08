require 'test_helper'

class SanatoriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sanatorio = sanatorios(:one)
  end

  test "should get index" do
    get sanatorios_url
    assert_response :success
  end

  test "should get new" do
    get new_sanatorio_url
    assert_response :success
  end

  test "should create sanatorio" do
    assert_difference('Sanatorio.count') do
      post sanatorios_url, params: { sanatorio: { direccion: @sanatorio.direccion, nombre: @sanatorio.nombre, pagina: @sanatorio.pagina, photo: @sanatorio.photo, telefon3: @sanatorio.telefon3, telefono1: @sanatorio.telefono1, telefono2: @sanatorio.telefono2 } }
    end

    assert_redirected_to sanatorio_url(Sanatorio.last)
  end

  test "should show sanatorio" do
    get sanatorio_url(@sanatorio)
    assert_response :success
  end

  test "should get edit" do
    get edit_sanatorio_url(@sanatorio)
    assert_response :success
  end

  test "should update sanatorio" do
    patch sanatorio_url(@sanatorio), params: { sanatorio: { direccion: @sanatorio.direccion, nombre: @sanatorio.nombre, pagina: @sanatorio.pagina, photo: @sanatorio.photo, telefon3: @sanatorio.telefon3, telefono1: @sanatorio.telefono1, telefono2: @sanatorio.telefono2 } }
    assert_redirected_to sanatorio_url(@sanatorio)
  end

  test "should destroy sanatorio" do
    assert_difference('Sanatorio.count', -1) do
      delete sanatorio_url(@sanatorio)
    end

    assert_redirected_to sanatorios_url
  end
end

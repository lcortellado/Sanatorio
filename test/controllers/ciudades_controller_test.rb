require 'test_helper'

class CiudadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ciudade = ciudades(:one)
  end

  test "should get index" do
    get ciudades_url
    assert_response :success
  end

  test "should get new" do
    get new_ciudade_url
    assert_response :success
  end

  test "should create ciudade" do
    assert_difference('Ciudade.count') do
      post ciudades_url, params: { ciudade: { codigo: @ciudade.codigo, departamento_id: @ciudade.departamento_id, nombre: @ciudade.nombre } }
    end

    assert_redirected_to ciudade_url(Ciudade.last)
  end

  test "should show ciudade" do
    get ciudade_url(@ciudade)
    assert_response :success
  end

  test "should get edit" do
    get edit_ciudade_url(@ciudade)
    assert_response :success
  end

  test "should update ciudade" do
    patch ciudade_url(@ciudade), params: { ciudade: { codigo: @ciudade.codigo, departamento_id: @ciudade.departamento_id, nombre: @ciudade.nombre } }
    assert_redirected_to ciudade_url(@ciudade)
  end

  test "should destroy ciudade" do
    assert_difference('Ciudade.count', -1) do
      delete ciudade_url(@ciudade)
    end

    assert_redirected_to ciudades_url
  end
end

require 'test_helper'

class HabitacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habitacione = habitaciones(:one)
  end

  test "should get index" do
    get habitaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_habitacione_url
    assert_response :success
  end

  test "should create habitacione" do
    assert_difference('Habitacione.count') do
      post habitaciones_url, params: { habitacione: { descripcion: @habitacione.descripcion, nrohabit: @habitacione.nrohabit } }
    end

    assert_redirected_to habitacione_url(Habitacione.last)
  end

  test "should show habitacione" do
    get habitacione_url(@habitacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_habitacione_url(@habitacione)
    assert_response :success
  end

  test "should update habitacione" do
    patch habitacione_url(@habitacione), params: { habitacione: { descripcion: @habitacione.descripcion, nrohabit: @habitacione.nrohabit } }
    assert_redirected_to habitacione_url(@habitacione)
  end

  test "should destroy habitacione" do
    assert_difference('Habitacione.count', -1) do
      delete habitacione_url(@habitacione)
    end

    assert_redirected_to habitaciones_url
  end
end

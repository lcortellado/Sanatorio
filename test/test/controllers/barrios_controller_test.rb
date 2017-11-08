require 'test_helper'

class BarriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barrio = barrios(:one)
  end

  test "should get index" do
    get barrios_url
    assert_response :success
  end

  test "should get new" do
    get new_barrio_url
    assert_response :success
  end

  test "should create barrio" do
    assert_difference('Barrio.count') do
      post barrios_url, params: { barrio: { distrito_id: @barrio.distrito_id, nombre: @barrio.nombre } }
    end

    assert_redirected_to barrio_url(Barrio.last)
  end

  test "should show barrio" do
    get barrio_url(@barrio)
    assert_response :success
  end

  test "should get edit" do
    get edit_barrio_url(@barrio)
    assert_response :success
  end

  test "should update barrio" do
    patch barrio_url(@barrio), params: { barrio: { distrito_id: @barrio.distrito_id, nombre: @barrio.nombre } }
    assert_redirected_to barrio_url(@barrio)
  end

  test "should destroy barrio" do
    assert_difference('Barrio.count', -1) do
      delete barrio_url(@barrio)
    end

    assert_redirected_to barrios_url
  end
end

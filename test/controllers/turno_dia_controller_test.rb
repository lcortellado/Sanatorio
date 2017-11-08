require 'test_helper'

class TurnoDiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turno_dias = turno_dia(:one)
  end

  test "should get index" do
    get turno_dia_url
    assert_response :success
  end

  test "should get new" do
    get new_turno_dias_url
    assert_response :success
  end

  test "should create turno_dias" do
    assert_difference('TurnoDias.count') do
      post turno_dia_url, params: { turno_dias: { nombre: @turno_dias.nombre } }
    end

    assert_redirected_to turno_dias_url(TurnoDias.last)
  end

  test "should show turno_dias" do
    get turno_dias_url(@turno_dias)
    assert_response :success
  end

  test "should get edit" do
    get edit_turno_dias_url(@turno_dias)
    assert_response :success
  end

  test "should update turno_dias" do
    patch turno_dias_url(@turno_dias), params: { turno_dias: { nombre: @turno_dias.nombre } }
    assert_redirected_to turno_dias_url(@turno_dias)
  end

  test "should destroy turno_dias" do
    assert_difference('TurnoDias.count', -1) do
      delete turno_dias_url(@turno_dias)
    end

    assert_redirected_to turno_dia_url
  end
end

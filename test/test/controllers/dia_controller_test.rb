require 'test_helper'

class DiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dias = dia(:one)
  end

  test "should get index" do
    get dia_url
    assert_response :success
  end

  test "should get new" do
    get new_dias_url
    assert_response :success
  end

  test "should create dias" do
    assert_difference('Dias.count') do
      post dia_url, params: { dias: { codigo: @dias.codigo, nombre: @dias.nombre } }
    end

    assert_redirected_to dias_url(Dias.last)
  end

  test "should show dias" do
    get dias_url(@dias)
    assert_response :success
  end

  test "should get edit" do
    get edit_dias_url(@dias)
    assert_response :success
  end

  test "should update dias" do
    patch dias_url(@dias), params: { dias: { codigo: @dias.codigo, nombre: @dias.nombre } }
    assert_redirected_to dias_url(@dias)
  end

  test "should destroy dias" do
    assert_difference('Dias.count', -1) do
      delete dias_url(@dias)
    end

    assert_redirected_to dia_url
  end
end

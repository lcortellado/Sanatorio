require 'test_helper'

class TipoConsultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_consult = tipo_consults(:one)
  end

  test "should get index" do
    get tipo_consults_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_consult_url
    assert_response :success
  end

  test "should create tipo_consult" do
    assert_difference('TipoConsult.count') do
      post tipo_consults_url, params: { tipo_consult: { descripcion: @tipo_consult.descripcion } }
    end

    assert_redirected_to tipo_consult_url(TipoConsult.last)
  end

  test "should show tipo_consult" do
    get tipo_consult_url(@tipo_consult)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_consult_url(@tipo_consult)
    assert_response :success
  end

  test "should update tipo_consult" do
    patch tipo_consult_url(@tipo_consult), params: { tipo_consult: { descripcion: @tipo_consult.descripcion } }
    assert_redirected_to tipo_consult_url(@tipo_consult)
  end

  test "should destroy tipo_consult" do
    assert_difference('TipoConsult.count', -1) do
      delete tipo_consult_url(@tipo_consult)
    end

    assert_redirected_to tipo_consults_url
  end
end

require 'test_helper'

class InternacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internacione = internaciones(:one)
  end

  test "should get index" do
    get internaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_internacione_url
    assert_response :success
  end

  test "should create internacione" do
    assert_difference('Internacione.count') do
      post internaciones_url, params: { internacione: { fechaIng: @internacione.fechaIng, fechaSalida: @internacione.fechaSalida, habitacione_id: @internacione.habitacione_id, horaIng: @internacione.horaIng, horaSalida: @internacione.horaSalida, medico_id: @internacione.medico_id, paciente_id: @internacione.paciente_id, totalGasto: @internacione.totalGasto } }
    end

    assert_redirected_to internacione_url(Internacione.last)
  end

  test "should show internacione" do
    get internacione_url(@internacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_internacione_url(@internacione)
    assert_response :success
  end

  test "should update internacione" do
    patch internacione_url(@internacione), params: { internacione: { fechaIng: @internacione.fechaIng, fechaSalida: @internacione.fechaSalida, habitacione_id: @internacione.habitacione_id, horaIng: @internacione.horaIng, horaSalida: @internacione.horaSalida, medico_id: @internacione.medico_id, paciente_id: @internacione.paciente_id, totalGasto: @internacione.totalGasto } }
    assert_redirected_to internacione_url(@internacione)
  end

  test "should destroy internacione" do
    assert_difference('Internacione.count', -1) do
      delete internacione_url(@internacione)
    end

    assert_redirected_to internaciones_url
  end
end

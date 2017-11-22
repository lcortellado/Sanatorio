require 'test_helper'

class MedicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medico = medicos(:one)
  end

  test "should get index" do
    get medicos_url
    assert_response :success
  end

  test "should get new" do
    get new_medico_url
    assert_response :success
  end

  test "should create medico" do
    assert_difference('Medico.count') do
      post medicos_url, params: { medico: { apellido: @medico.apellido, celular: @medico.celular, ci: @medico.ci, ciudade_id: @medico.ciudade_id, contacto_familiar: @medico.contacto_familiar, correo: @medico.correo, direccion: @medico.direccion, especialidade_id: @medico.especialidade_id, fecha_naci: @medico.fecha_naci, nombre: @medico.nombre, nro_registro: @medico.nro_registro, sexo: @medico.sexo, telefono: @medico.telefono } }
    end

    assert_redirected_to medico_url(Medico.last)
  end

  test "should show medico" do
    get medico_url(@medico)
    assert_response :success
  end

  test "should get edit" do
    get edit_medico_url(@medico)
    assert_response :success
  end

  test "should update medico" do
    patch medico_url(@medico), params: { medico: { apellido: @medico.apellido, celular: @medico.celular, ci: @medico.ci, ciudade_id: @medico.ciudade_id, contacto_familiar: @medico.contacto_familiar, correo: @medico.correo, direccion: @medico.direccion, especialidade_id: @medico.especialidade_id, fecha_naci: @medico.fecha_naci, nombre: @medico.nombre, nro_registro: @medico.nro_registro, sexo: @medico.sexo, telefono: @medico.telefono } }
    assert_redirected_to medico_url(@medico)
  end

  test "should destroy medico" do
    assert_difference('Medico.count', -1) do
      delete medico_url(@medico)
    end

    assert_redirected_to medicos_url
  end
end

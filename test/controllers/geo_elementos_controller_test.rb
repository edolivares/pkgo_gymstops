require 'test_helper'

class GeoElementosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geo_elemento = geo_elementos(:one)
  end

  test "should get index" do
    get geo_elementos_url
    assert_response :success
  end

  test "should get new" do
    get new_geo_elemento_url
    assert_response :success
  end

  test "should create geo_elemento" do
    assert_difference('GeoElemento.count') do
      post geo_elementos_url, params: { geo_elemento: { latitude: @geo_elemento.latitude, longitude: @geo_elemento.longitude, name: @geo_elemento.name, tipo: @geo_elemento.tipo, votes: @geo_elemento.votes } }
    end

    assert_redirected_to geo_elemento_url(GeoElemento.last)
  end

  test "should show geo_elemento" do
    get geo_elemento_url(@geo_elemento)
    assert_response :success
  end

  test "should get edit" do
    get edit_geo_elemento_url(@geo_elemento)
    assert_response :success
  end

  test "should update geo_elemento" do
    patch geo_elemento_url(@geo_elemento), params: { geo_elemento: { latitude: @geo_elemento.latitude, longitude: @geo_elemento.longitude, name: @geo_elemento.name, tipo: @geo_elemento.tipo, votes: @geo_elemento.votes } }
    assert_redirected_to geo_elemento_url(@geo_elemento)
  end

  test "should destroy geo_elemento" do
    assert_difference('GeoElemento.count', -1) do
      delete geo_elemento_url(@geo_elemento)
    end

    assert_redirected_to geo_elementos_url
  end
end

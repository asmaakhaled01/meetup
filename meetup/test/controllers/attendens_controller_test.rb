require 'test_helper'

class AttendensControllerTest < ActionController::TestCase
  setup do
    @attenden = attendens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attenden" do
    assert_difference('Attenden.count') do
      post :create, attenden: { event_id: @attenden.event_id, user_id: @attenden.user_id }
    end

    assert_redirected_to attenden_path(assigns(:attenden))
  end

  test "should show attenden" do
    get :show, id: @attenden
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attenden
    assert_response :success
  end

  test "should update attenden" do
    patch :update, id: @attenden, attenden: { event_id: @attenden.event_id, user_id: @attenden.user_id }
    assert_redirected_to attenden_path(assigns(:attenden))
  end

  test "should destroy attenden" do
    assert_difference('Attenden.count', -1) do
      delete :destroy, id: @attenden
    end

    assert_redirected_to attendens_path
  end
end

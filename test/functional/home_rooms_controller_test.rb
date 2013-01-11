require 'test_helper'

class HomeRoomsControllerTest < ActionController::TestCase
  setup do
    @home_room = home_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_room" do
    assert_difference('HomeRoom.count') do
      post :create, home_room: { homeroom_number: @home_room.homeroom_number, teacher_id: @home_room.teacher_id }
    end

    assert_redirected_to home_room_path(assigns(:home_room))
  end

  test "should show home_room" do
    get :show, id: @home_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_room
    assert_response :success
  end

  test "should update home_room" do
    put :update, id: @home_room, home_room: { homeroom_number: @home_room.homeroom_number, teacher_id: @home_room.teacher_id }
    assert_redirected_to home_room_path(assigns(:home_room))
  end

  test "should destroy home_room" do
    assert_difference('HomeRoom.count', -1) do
      delete :destroy, id: @home_room
    end

    assert_redirected_to home_rooms_path
  end
end

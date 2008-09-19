require 'test_helper'

class MovementsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:movements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_movement
    assert_difference('Movement.count') do
      post :create, :movement => { }
    end

    assert_redirected_to movement_path(assigns(:movement))
  end

  def test_should_show_movement
    get :show, :id => movements(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => movements(:one).id
    assert_response :success
  end

  def test_should_update_movement
    put :update, :id => movements(:one).id, :movement => { }
    assert_redirected_to movement_path(assigns(:movement))
  end

  def test_should_destroy_movement
    assert_difference('Movement.count', -1) do
      delete :destroy, :id => movements(:one).id
    end

    assert_redirected_to movements_path
  end
end

require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:positions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_position
    assert_difference('Position.count') do
      post :create, :position => { }
    end

    assert_redirected_to position_path(assigns(:position))
  end

  def test_should_show_position
    get :show, :id => positions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => positions(:one).id
    assert_response :success
  end

  def test_should_update_position
    put :update, :id => positions(:one).id, :position => { }
    assert_redirected_to position_path(assigns(:position))
  end

  def test_should_destroy_position
    assert_difference('Position.count', -1) do
      delete :destroy, :id => positions(:one).id
    end

    assert_redirected_to positions_path
  end
end

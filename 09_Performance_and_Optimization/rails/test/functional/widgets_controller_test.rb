require File.dirname(__FILE__) + '/../test_helper'

class WidgetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:widgets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_widget
    assert_difference('Widget.count') do
      post :create, :widget => { }
    end

    assert_redirected_to widget_path(assigns(:widget))
  end

  def test_should_show_widget
    get :show, :id => widgets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => widgets(:one).id
    assert_response :success
  end

  def test_should_update_widget
    put :update, :id => widgets(:one).id, :widget => { }
    assert_redirected_to widget_path(assigns(:widget))
  end

  def test_should_destroy_widget
    assert_difference('Widget.count', -1) do
      delete :destroy, :id => widgets(:one).id
    end

    assert_redirected_to widgets_path
  end
end

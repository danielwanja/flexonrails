require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_asset
    assert_difference('Asset.count') do
      post :create, :asset => { }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  def test_should_show_asset
    get :show, :id => assets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => assets(:one).id
    assert_response :success
  end

  def test_should_update_asset
    put :update, :id => assets(:one).id, :asset => { }
    assert_redirected_to asset_path(assigns(:asset))
  end

  def test_should_destroy_asset
    assert_difference('Asset.count', -1) do
      delete :destroy, :id => assets(:one).id
    end

    assert_redirected_to assets_path
  end
end

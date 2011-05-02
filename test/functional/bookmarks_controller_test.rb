require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmark" do
    User.current = users(:one)
    assert_difference('Bookmark.count') do
      post :create, :bookmark => {:name => "foo-bar", :query => "bar", :public => false, :controller => "hosts"}
    end

    assert_redirected_to hosts_path
  end

  test "should get edit" do
    get :edit, :id => bookmarks(:one).to_param
    assert_response :success
  end

  test "should update bookmark" do
    put :update, :id => bookmarks(:one).to_param, :bookmark => { }
    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete :destroy, :id => bookmarks(:one).to_param
    end

    assert_redirected_to bookmarks_path
  end
end

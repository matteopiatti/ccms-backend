require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_url
    assert_response :success
  end

  test "should create page with valid slug" do
    assert_difference("Page.count", 1) do
      post pages_url, params: { page: { title: "My Cool Item", slug: "my/cool-item" } }
    end
    assert_response :created
  end
end

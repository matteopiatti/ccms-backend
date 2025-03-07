require "test_helper"

class PageTest < ActiveSupport::TestCase
  test "valid slug without a slash" do
    page = Page.new(title: "Test", slug: "test")
    assert page.valid?, "Page should be valid with a proper slug"
  end

  test "valid slug starting with a slash" do
    page = Page.new(title: "My Cool Page", slug: "/my/cool-page")
    assert page.valid?, "Page should be valid with a slug starting with a slash"
  end

  test "invalid slug with spaces" do
    page = Page.new(title: "My Cool Page", slug: "my cool/page")
    refute page.valid?, "Page should not be valid when the slug contains spaces"
  end

  test "invalid slug with special characters" do
    page = Page.new(title: "My Cool page", slug: "page@slug")
    refute page.valid?, "Page should not be valid when the slug contains special characters"
  end

  test "invalid slug with consecutive slashes" do
    page = Page.new(title: "My Cool page", slug: "page//slug")
    refute page.valid?, "Page should not be valid when the slug contains consecutive slashes"
  end

  test "invalid without a title" do
    page = Page.new(slug: "valid-slug")
    refute page.valid?, "Page should not be valid without a title"
  end

  # Test for missing slug (optional, just for completeness)
  test "invalid without a slug" do
    page = Page.new(title: "My Cool Item")
    refute page.valid?, "Page should not be valid without a slug"
  end
end

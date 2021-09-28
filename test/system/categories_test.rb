require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Title", with: @category.title
    click_on "Create Category"

    assert_text "Category was successfully created"
    assert_selector "h1", text: "Categories"
  end

  test "updating a Category" do
    visit category_url(@category)
    click_on "Edit", match: :first

    fill_in "Title", with: @category.title
    click_on "Update Category"

    assert_text "Category was successfully updated"
    assert_selector "h1", text: "Categories"
  end

  test "destroying a Category" do
    visit edit_category_url(@category)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Category was successfully destroyed"
  end
end

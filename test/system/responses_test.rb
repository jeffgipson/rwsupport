require "application_system_test_case"

class ResponsesTest < ApplicationSystemTestCase
  setup do
    @response = responses(:one)
  end

  test "visiting the index" do
    visit responses_url
    assert_selector "h1", text: "Responses"
  end

  test "creating a Response" do
    visit responses_url
    click_on "New Response"

    fill_in "Ticket", with: @response.ticket_id
    fill_in "Title", with: @response.title
    fill_in "User", with: @response.user_id
    click_on "Create Response"

    assert_text "Response was successfully created"
    assert_selector "h1", text: "Responses"
  end

  test "updating a Response" do
    visit response_url(@response)
    click_on "Edit", match: :first

    fill_in "Ticket", with: @response.ticket_id
    fill_in "Title", with: @response.title
    fill_in "User", with: @response.user_id
    click_on "Update Response"

    assert_text "Response was successfully updated"
    assert_selector "h1", text: "Responses"
  end

  test "destroying a Response" do
    visit edit_response_url(@response)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Response was successfully destroyed"
  end
end

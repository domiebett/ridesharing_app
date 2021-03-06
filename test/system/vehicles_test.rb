require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @vehicle = vehicles(:one)

    visit new_user_session_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "creating a Vehicle" do
    visit vehicles_url
    click_on "New Vehicle"

    fill_in "Capacity", with: @vehicle.capacity
    fill_in "License Plate", with: @vehicle.license_plate
    fill_in "Type", with: @vehicle.type
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle" do
    visit vehicles_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @vehicle.capacity
    fill_in "License Plate", with: @vehicle.license_plate
    fill_in "Type", with: @vehicle.type
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle" do
    visit vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle was successfully destroyed"
  end
end

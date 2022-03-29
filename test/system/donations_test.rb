require "application_system_test_case"

class DonationsTest < ApplicationSystemTestCase
  setup do
    @donation = donations(:one)
  end

  test "visiting the index" do
    visit donations_url
    assert_selector "h1", text: "Donations"
  end

  test "should create donation" do
    visit donations_url
    click_on "New donation"

    fill_in "Amount", with: @donation.amount
    fill_in "Description", with: @donation.description
    fill_in "Email", with: @donation.email
    fill_in "Name", with: @donation.name
    click_on "Create Donation"

    assert_text "Donation was successfully created"
    click_on "Back"
  end

  test "should update Donation" do
    visit donation_url(@donation)
    click_on "Edit this donation", match: :first

    fill_in "Amount", with: @donation.amount
    fill_in "Description", with: @donation.description
    fill_in "Email", with: @donation.email
    fill_in "Name", with: @donation.name
    click_on "Update Donation"

    assert_text "Donation was successfully updated"
    click_on "Back"
  end

  test "should destroy Donation" do
    visit donation_url(@donation)
    click_on "Destroy this donation", match: :first

    assert_text "Donation was successfully destroyed"
  end
end

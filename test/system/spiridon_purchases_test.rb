require "application_system_test_case"

class SpiridonPurchasesTest < ApplicationSystemTestCase
  setup do
    @spiridon_purchase = spiridon_purchases(:one)
  end

  test "visiting the index" do
    visit spiridon_purchases_url
    assert_selector "h1", text: "Spiridon Purchases"
  end

  test "creating a Spiridon purchase" do
    visit spiridon_purchases_url
    click_on "New Spiridon Purchase"

    fill_in "Amount", with: @spiridon_purchase.amount
    fill_in "Operator", with: @spiridon_purchase.operator_id
    click_on "Create Spiridon purchase"

    assert_text "Spiridon purchase was successfully created."
    click_on "Back"
  end

  test "updating a Spiridon purchase" do
    visit spiridon_purchases_url
    click_on "Edit it", match: :first

    fill_in "Amount", with: @spiridon_purchase.amount
    fill_in "Operator", with: @spiridon_purchase.operator_id
    click_on "Update Spiridon purchase"

    assert_text "Spiridon purchase was successfully updated."
    click_on "Back"
  end

  test "destroying a Spiridon purchase" do
    visit spiridon_purchases_url
    page.accept_confirm do
      click_on "Destroy it", match: :first
    end

    assert_text "Spiridon purchase was successfully destroyed."
  end
end

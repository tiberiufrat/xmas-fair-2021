require "test_helper"

class SpiridonPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spiridon_purchase = spiridon_purchases(:one)
  end

  test "should get index" do
    get spiridon_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_spiridon_purchase_url
    assert_response :success
  end

  test "should create spiridon_purchase" do
    assert_difference('SpiridonPurchase.count') do
      post spiridon_purchases_url, params: { spiridon_purchase: { amount: @spiridon_purchase.amount, operator_id: @spiridon_purchase.operator_id } }
    end

    assert_redirected_to spiridon_purchase_url(SpiridonPurchase.last)
  end

  test "should show spiridon_purchase" do
    get spiridon_purchase_url(@spiridon_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_spiridon_purchase_url(@spiridon_purchase)
    assert_response :success
  end

  test "should update spiridon_purchase" do
    patch spiridon_purchase_url(@spiridon_purchase), params: { spiridon_purchase: { amount: @spiridon_purchase.amount, operator_id: @spiridon_purchase.operator_id } }
    assert_redirected_to spiridon_purchase_url(@spiridon_purchase)
  end

  test "should destroy spiridon_purchase" do
    assert_difference('SpiridonPurchase.count', -1) do
      delete spiridon_purchase_url(@spiridon_purchase)
    end

    assert_redirected_to spiridon_purchases_url
  end
end

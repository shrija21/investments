require 'test_helper'

class InvestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invest = invests(:one)
  end

  test "should get index" do
    get invests_url
    assert_response :success
  end

  test "should get new" do
    get new_invest_url
    assert_response :success
  end

  test "should create invest" do
    assert_difference('Invest.count') do
      post invests_url, params: { invest: { amount: @invest.amount, selected_date: @invest.selected_date } }
    end

    assert_redirected_to invest_url(Invest.last)
  end

  test "should show invest" do
    get invest_url(@invest)
    assert_response :success
  end

  test "should get edit" do
    get edit_invest_url(@invest)
    assert_response :success
  end

  test "should update invest" do
    patch invest_url(@invest), params: { invest: { amount: @invest.amount, selected_date: @invest.selected_date } }
    assert_redirected_to invest_url(@invest)
  end

  test "should destroy invest" do
    assert_difference('Invest.count', -1) do
      delete invest_url(@invest)
    end

    assert_redirected_to invests_url
  end
end

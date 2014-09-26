require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!
  end

  test 'valid authentication with token' do
    get '/api/users', {}, { 'Authorization' => "Token token=#{@user.token}"}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    get '/api/users', {}, { 'Authorization' => @user.token + 'fake' }
    assert_equal 401, response.status
  end
end

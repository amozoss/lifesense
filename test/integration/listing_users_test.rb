require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(name: "Example User", email: "user@example.com",
                                          password: "foobar", password_confirmation: "foobar")
  end

  test 'valid authentication with token' do
    @user.generate_token
    get '/api/users', {}, { 'Authorization' => token_header(@user.token)}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'fetch one user' do
    @user.generate_token
    get "/api/users/#{@user.id}", {}, { 'Authorization' => token_header(@user.token)}
    puts response.body
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    @user.generate_token
    get '/api/users', {}, { 'Authorization' => "Token token=fake#{@user.token}" }
    assert_equal 401, response.status
  end

end

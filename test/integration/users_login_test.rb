require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include AssertJson

  test 'login with valid information' do
    post '/api/login', { email: "joe@joe.com", password: "joejoe" }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_json(response.body) do
      has :user do
        has :id
        has :email, "joe@joe.com"
        has :token
        has :name, "joe"
      end
    end

  end

  test 'login with valid token' do
    post '/api/login', {}, { 'Authorization' => "Token token=#{users(:joe).token}"}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_json(response.body) do
      has :user do
        has :id
        has :email, "joe@joe.com"
        has :token
        has :name, "joe"
      end
    end
  end

  test 'login with invalid token' do
    post '/api/login', {}, { 'Authorization' => "Token token=fake#{users(:joe).token}"}
    assert_equal 401, response.status
    assert_equal Mime::JSON, response.content_type

    post '/api/login', {}
    assert_equal 401, response.status
    assert_equal Mime::JSON, response.content_type
  end


  test 'login with invalid information' do
    post '/api/login', { email: "joe@joe1.com", password: "foobar" }
    assert_equal Mime::JSON, response.content_type
    assert_equal 401, response.status

    post '/api/login'
    assert_equal Mime::JSON, response.content_type
    assert_equal 401, response.status
  end
end

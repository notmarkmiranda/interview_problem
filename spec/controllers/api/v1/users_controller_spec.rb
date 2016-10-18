require "rails_helper"

describe Api::V1::UsersController do
  before do
    create_users(2)
  end

  it "GET#index" do
    get :index, format: :json
    users = JSON.parse(response.body)
    expect(response).to be_success
    expect(users.count).to eq(2)
  end

  it "GET#show" do
    user1 = User.first
    get :show, id: user1.id, format: :json
    user = JSON.parse(response.body)
    expect(response).to be_success
    expect(user["id"]).to eq(user1.id)
  end

  it "GET#show - sad path" do
    user = User.last
    get :show, id: user.id + 1, format: :json
    user = JSON.parse(response.body)
    expect(response.status).to eq(404)
    expect(user["message"]).to eq("no user")
  end

  it "POST#create" do
    params = { first_name: "a",
      last_name: "b",
      email: "a@b.com",
      social_security_number: "576173854"
    }
    post :create, user: params, format: :json
    json_response = JSON.parse(response.body)
    user = User.last
    expect(response).to be_success
    expect(json_response["id"]).to eq(user.id)
  end

  it "POST#create" do
    params = { first_name: "a",
      email: "a@b.com",
      social_security_number: "576173854"
    }
    post :create, user: params, format: :json
    json_response = JSON.parse(response.body)
    expect(response.status).to eq(400)
    expect(json_response["message"]).to eq("Last name can't be blank")
  end
end

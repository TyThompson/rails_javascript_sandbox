require 'rails_helper'

describe ListsController do
  it "lets users create lists" do
    user = User.create! email: "user@example.com", password: "hunter2"
    sign_in user

    # expect do
    #   response = post :create, title: "New List"
    # end.to change { user.lists.count }.by 1

    old_count = user.lists.count
    response = post :create, title: "New List"

    expect(response.status).to eq 302
    expect(user.lists.count).to eq old_count + 1
    expect(user.lists.last.title).to eq "New List"
  end

  it "disallows deleting other lists" do
    user = User.create! email: "user@example.com", password: "hunter2"
    sign_in user

    other = User.create! email: "user2@example.com", password: "hunter2"
    list  = other.lists.create! title: "Not your list"

    count = other.lists.count
    response = delete :destroy, id: list.id

    expect(response.status).to eq 302
    # List.find list.id works ...
    expect(other.lists.count).to eq count
  end

  skip "can test policies" do
    user = User.first
    list = List.last

    p = ListPolicy.new(user, list)

    expect(p.create?).to eq true
    expect(p.destroy?).to eq false
  end
end

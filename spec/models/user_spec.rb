require 'rails_helper'

RSpec.describe User, type: :model do
  it "knows users aren't floopy" do
    expect(User.new).not_to be_floopy
  end
end

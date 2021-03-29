require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    name: 'MyString'
                  ))
  end

  it 'renders new user form' do
    render
    assert_select 'input[name=?]', 'user[name]'
  end
end

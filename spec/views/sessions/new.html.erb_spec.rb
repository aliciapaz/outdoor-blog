require 'rails_helper'

RSpec.describe 'sessions/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    name: 'MyString'
                  ))
  end

  it 'renders login form' do
    render
    assert_select 'input[name=?]', 'name'
  end
end

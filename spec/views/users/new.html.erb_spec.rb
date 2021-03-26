require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                                  name: 'My Name',
                                ))
  end

  it 'renders attributes in form' do
    render
    expect(rendered).to match(/My Name/)
  end
end

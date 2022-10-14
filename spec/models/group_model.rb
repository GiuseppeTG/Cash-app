require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Forniture',
                       icon: 'https://cdn.dribbble.com/users/427368/screenshots/11957384/media/b30716e802df7b4c46057fc44bf207d2.jpg?compress=1&resize=400x300',
                       user: @user)
    @group.save
  end

  it 'Name is required' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'Icon is required' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end

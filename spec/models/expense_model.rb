require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @group = Group.new(name: 'Forniture',
                       icon: 'https://cdn.dribbble.com/users/427368/screenshots/11957384/media/b30716e802df7b4c46057fc44bf207d2.jpg?compress=1&resize=400x300',
                       user: @user)
    @group.save
    @expense = Expense.new(name: 'Bed', amount: 100, user: @user)
  end

  it 'Name is required' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'Amount is required' do
    @expense.amount = -1
    expect(@expense).to_not be_valid
  end

  it 'Amount is required' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end

  it 'Amount is required' do
    @expense.amount = 1
    expect(@expense).to be_valid
  end
end

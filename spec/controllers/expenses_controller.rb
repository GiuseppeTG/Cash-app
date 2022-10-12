require 'rails_helper'

RSpec.describe 'Expenses controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Forniture',
                       icon: 'https://cdn.dribbble.com/users/427368/screenshots/11957384/media/b30716e802df7b4c46057fc44bf207d2.jpg?compress=1&resize=400x300',
                       user: @user)
    @group.save
    @expense = Expense.new(name: 'Bed', amount: 100, user: @user)
    sign_in(@user)
  end

  it 'Renders the index template' do
    get group_expenses_path(@group)
    expect(response).to render_template('index')
  end

  it 'Should render the correct text' do
    get group_expenses_path(@group)
    expect(response.body).to include('Expenses')
  end

  it 'Get 200 status' do
    get group_expenses_path(@group)
    expect(response).to have_http_status(200)
  end
end

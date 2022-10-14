require 'rails_helper'

RSpec.describe 'Integration', type: :system do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Forniture',
                       icon: 'https://cdn.dribbble.com/users/427368/screenshots/11957384/media/b30716e802df7b4c46057fc44bf207d2.jpg?compress=1&resize=400x300',
                       user: @user)
    @group.save
    sign_in(@user)
  end

  it 'Contains group information' do
    visit '/groups'
    expect(page.body).to include('Categories')
  end

  it 'Group icon redirects expenses path' do
    visit '/groups'
    find(:xpath, "//a/img[@alt='Forniture icon']/..").click
    sleep(0.1)
    expect(page.body).to include('Expenses')
    expect(page.body).to include('Add a new Expense')
  end

  it 'Logout button redirects to login' do
    visit '/groups'
    click_on('Log out')
    expect(page.body).to include('LOG IN')
  end

  it 'Delete button redirects to categories' do
    visit '/groups'
    click_on('Delete')
    expect(page.body).to include('Categories')
  end

  it 'Add new category redirects to category' do
    visit '/groups'
    click_on('Add a new Category')
    sleep(0.1)
    expect(page.body).to include('New category')
  end

  it 'Add a new expense redirects to expense' do
    visit "groups/#{@group.id}/expenses"
    click_on('Add a new Expense')
    sleep(0.1)
    expect(page.body).to include('New expense')
  end
end

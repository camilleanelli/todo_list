require 'spec_helper'

describe 'editing todolists' do
  it 'update todolist with correct information' do
    todolist = Todolist.create(title: "My title", description:"My description")

    visit '/todolists'
    within "#todolist_#{todolist.id}" do
      click_link 'Edit'
    end

    fill_in 'Title', with: "New title"
    fill_in 'Description', with: "New description"
    click_button 'Update Todolist'

    todolist.reload

    expect(page).to have_content('New title')
    
  end
end

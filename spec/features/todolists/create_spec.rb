require 'spec_helper'

describe 'creating todolists' do
  it 'redirect to the todolist index page' do
    visit '/todolists'
    click_link 'New Todolist'
    expect(page).to have_content("New Todolist")

    fill_in 'Title', with: 'My title'
    fill_in 'Description', with: "My description"
    click_button 'Create Todolist'
    expect(page).to have_content('My title')
 end

 it 'display an error when todolist has no title' do
   expect(Todolist.count).to eq(0)

   visit '/todolists'
   click_link 'New Todolist'
   expect(page).to have_content("New Todolist")

   fill_in 'Title', with: ''
   fill_in 'Description', with: "My description"
   click_button 'Create Todolist'
   expect(page).to have_content('error')

   expect(Todolist.count).to eq(0)
   visit '/todolists'
   expect(page).not_to have_content("My description")
 end
 it 'display an error when todolist title has less than 3 characters' do
   expect(Todolist.count).to eq(0)

   visit '/todolists'
   click_link 'New Todolist'
   expect(page).to have_content("New Todolist")

   fill_in 'Title', with: 'HH'
   fill_in 'Description', with: "My description"
   click_button 'Create Todolist'
   expect(page).to have_content('error')

   expect(Todolist.count).to eq(0)
   visit '/todolists'
   expect(page).not_to have_content("My description")
 end
end

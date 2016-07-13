require 'spec_helper'

describe 'creating todolists' do

  def create_todolist(options={})
    options[:title] ||= "My title"
    options[:description] ||= "My description"
    visit '/todolists'
    click_link 'New Todolist'
    expect(page).to have_content("New Todolist")
    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Create Todolist'

  end
  it 'redirect to the todolist index page' do
    create_todolist
    expect(page).to have_content('My title')
 end

 it 'display an error when todolist has no title' do
   expect(Todolist.count).to eq(0)

   create_todolist( title: "")
   expect(page).to have_content('error')

   expect(Todolist.count).to eq(0)
   visit '/todolists'
   expect(page).not_to have_content("My description")
 end
 it 'display an error when todolist title has less than 3 characters' do
   expect(Todolist.count).to eq(0)

   create_todolist(title: "HH")
   expect(page).to have_content('error')

   expect(Todolist.count).to eq(0)
   visit '/todolists'
   expect(page).not_to have_content("My description")
 end
 it 'display an error when todolist description is empty' do
   expect(Todolist.count).to eq(0)

   create_todolist(description: "")
   expect(page).to have_content('error')

   expect(Todolist.count).to eq(0)
   visit '/todolists'
   expect(page).not_to have_content("My title")
end
end

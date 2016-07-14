require 'spec_helper'

describe 'index items' do
  let!(:todolist) { Todolist.create(title: "My title", description: "My description") }

  it 'display title item' do
    visit '/todolists'

    click_link 'Items'
    expect(page).to have_content(todolist.title)
  end
end

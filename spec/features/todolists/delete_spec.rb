require 'spec_helper'

describe 'deleting todolist' do
  let!(:todolist) { Todolist.create(title: "My title", description: "My description") }

  it 'is successful when clicking the destroy link' do
    visit '/todolists'

    within "#todolist_#{todolist.id}" do
      click_link 'Destroy'
    end

    expect(page).to_not have_content(todolist.title)

  end
end

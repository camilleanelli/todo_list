require 'spec_helper'

describe 'editing items' do
 let!(:todolist) { Todolist.create(title: "My title", description: "My content" )}
 let!(:item) { todolist.items.create(content: "Milk")}

it "successful when delete item" do
    visit_todolist(todolist)
    within("#item_#{item.id}") do
      click_link 'Delete'
    end

    expect(page).to have_content("Item deleted!")
    expect(Item.count).to eq(0)
  end

end

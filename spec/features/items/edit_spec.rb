require 'spec_helper'

describe 'editing items' do
 let!(:todolist) { Todolist.create(title: "My title", description: "My content" )}
 let!(:item) { todolist.items.create(content: "Milk")}

 def visit_todolist(list)
    visit '/todolists'
    within "#todolist_#{todolist.id}" do
      click_link 'Items'
    end
  end
  it "is successful with valid content" do
    visit_todolist(todolist)
    within("#item_#{item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: "Lots of milk"
    click_button "Save"
    expect(page).to have_content("Saved item.")
    item.reload
    expect(item.content).to eq("Lots of milk")
  end

  it "is unsuccessful with no content" do
    visit_todolist(todolist)
    within("#item_#{item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: ""
    click_button "Save"
    expect(page).to have_content("Item could not be saved")
  end

  it "is unsuccessful with not enough content" do
    visit_todolist(todolist)
    within("#item_#{item.id}") do
      click_link "Edit"
    end
    fill_in "Content", with: "5"
    click_button "Save"
    expect(page).to have_content("Item could not be saved")  
  end

end

require 'spec_helper'

describe 'completing item' do
 let!(:todolist) { Todolist.create(title: "My title", description: "My content" )}
 let!(:item) { todolist.items.create(content: "Milk")}

 it "is successful when mark an item complete" do
   expect(item.completed_at).to be_nil
   visit_todolist(todolist)
   within("#item_#{item.id}") do
     click_link 'Mark complete'
   end
   item.reload
   expect(item.completed_at).to_not be_nil
 end

 end

module TodolistHelper
    def visit_todolist(list)
      visit '/todolists'
      within "#todolist_#{todolist.id}" do
        click_link 'Items'
      end
    end
end

require 'spec_helper'

describe 'adding item' do
  let!(:todolist) { Todolist.create(title: "My title", description: 'My desciption') }
end

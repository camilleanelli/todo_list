class ItemsController < ApplicationController
  def index
    @todolist = Todolist.find(params[:todolist_id])
  end
end

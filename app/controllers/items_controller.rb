class ItemsController < ApplicationController
  def index
    @todolist = Todolist.find(params[:todolist_id])
  end

  def new
    @todolist = Todolist.find(params[:todolist_id])
    @item = @todolist.items.new
  end

  def create
      @todolist = Todolist.find(params[:todolist_id])
      @item = @todolist.items.new(params_items)
      if @item.save
        flash[:success] = "Produit bien ajouté!"
        redirect_to todolist_items_path
      else
        flash[:error] = "Raté!"
        render action: :new
      end
  end

  private

  def params_items
    params[:item].permit(:content)
  end
end

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

  def edit
    @todolist = Todolist.find(params[:todolist_id])
    @item = @todolist.items.find(params[:id])
  end

  def update
    @todolist = Todolist.find(params[:todolist_id])
    @item = @todolist.items.find(params[:id])
    if @item.update_attributes(params_items)
      flash[:success] = "Saved item."
      redirect_to todolist_items_path
    else
      flash[:error] = "Item could not be saved"
      render action: :edit
    end
  end

  def url_options
    {todolist_id: params[:todolist_id]}.merge(super)
  end

  private

  def params_items
    params[:item].permit(:content)
  end
end

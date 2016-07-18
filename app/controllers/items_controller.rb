class ItemsController < ApplicationController
  before_action :find_todolist
  def index
  end

  def new
    @item = @todolist.items.new
  end

  def create
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
    @item = @todolist.items.find(params[:id])
  end

  def update
    @item = @todolist.items.find(params[:id])
    if @item.update_attributes(params_items)
      flash[:success] = "Saved item."
      redirect_to todolist_items_path
    else
      flash[:error] = "Item could not be saved"
      render action: :edit
    end
  end

  def destroy
    @item = @item = @todolist.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Item deleted!"
    else
      flash[:error] = "Could not be deleted"
    end
    redirect_to todolist_items_path
  end

  def url_options
    {todolist_id: params[:todolist_id]}.merge(super)
  end

  private

  def find_todolist
    @todolist = Todolist.find(params[:todolist_id])
  end

  def params_items
    params[:item].permit(:content)
  end
end

class ItemsController < ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @items = @department.items
  end

  def show
    @department = Department.find(params[:department_id])
    @item = Item.find(params[:id])
  end

  def new
    @department = Department.find(params[:department_id])
    @item = @department.items.new
    render partial: _form
  end

  def create
    @department = Department.find(params[:department_id])
    @item = @department.items.new(item_params)

    if @item.save
      redirect_to department_item_path[@department, @item]
    else
      render partial: _form
    end
  end

  def edit
    @department = Department.find(params[:department_id])
    @item = @department.items.find(params[:id])

    render :_form
  end

  def update
    @department = Department.find(params[:department_id])
    @item = @department.items.find(params[:id])

    if(@item.update(item_params))
      redirect_to department_items_path(@department)
    else
      render partial: _form
    end
  end


  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end

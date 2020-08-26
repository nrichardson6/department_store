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
    render partial: "form"
  end

  def edit
  end

  def destroy
  end
end

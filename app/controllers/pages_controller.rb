class PagesController < ApplicationController

layout 'admin'

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page #{@page.name} Was Successfully Created"
      redirect_to(pages_path)
    else
      render ('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page #{@page.name} Was Successfully Updated"
      redirect_to(pages_path(@page))
    else
      render ('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page #{@page.name} Was Successfully Deleted"
    redirect_to (pages_path)

  end

private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subject = Subject.sorted
  end

  def set_page_count
      @page_count = Page.count
      if params[:action] == 'new' || params[:action] == 'create'
        @page_count += 1
      end

  end

end

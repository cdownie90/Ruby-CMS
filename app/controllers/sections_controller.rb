class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
    end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section #{@section.name} Was Successfully Created!"
      redirect_to(sections_path@section)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section #{@section.name} Was Successfully Updated"
      redirect_to(sections_path(@section))
    else
      render ('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section #{@section.name} Was Successfully Deleted"
    redirect_to (sections_path)

  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end

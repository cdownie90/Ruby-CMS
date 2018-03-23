class SubjectsController < ApplicationController

layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject =Subject.new
  end

  def create
    #1 - instantiate new object using form parameters
    @subject = Subject.new(subject_params)
    #2 - save the object
    if @subject.save
      #3 - if save succeeds, redirect user (such as index action)
      flash[:notice] = "Subject '#{@subject.name}' Was Sucessfully Added!"
      redirect_to(subjects_path)
    else
      #4 - if save fails, redisplay form to user so corrections can be made.
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update

    #1 - find object using form parameters
    @subject = Subject.find(params[:id])
    #2 - update the object
    if @subject.update_attributes(subject_params)
      #3 - if save succeeds, redirect user (such as show action)
      flash[:notice] = "Subject '#{@subject.name}' Was Sucessfully Updated!"
      redirect_to(subject_path)
    else
      #4 - if save fails, redisplay form to user so corrections can be made.
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' Was Sucessfully Deleted!"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
end

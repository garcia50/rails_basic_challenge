class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    # redirect_to student_addresses_path(student)

  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    @student = Student.new(student_params)

    @student.save
    redirect_to @student
  end

  private
    def student_params
      params.require(:student).permit(:name, :weight, :height, :color, :gpa)
    end

  def edit
  end

  def update
  end

  def destroy
  end
end

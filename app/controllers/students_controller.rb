class StudentsController < ApplicationController
  def index
    @student = Student.all

    @weight = []
    @height = []
    @gpa = []


    @student.each do |s|
      @weight.push([s.name, s.weight])
      @height.push([s.name, s.height])
      @gpa.push([s.name, s.gpa])
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    @student.save
    redirect_to @student
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:name, :weight, :height, :color, :gpa)
    end
end

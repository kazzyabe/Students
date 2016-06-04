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
    @rank_list = [1,1,1]
    @rank_list_g = [1,1,1]
    @num_s = 0
    @num_g = 0

    Student.all.each do |s|
      @num_s = @num_s + 1
      if s.gender == @student.gender
        @num_g = @num_g + 1
      end

      if s.name != @student.name
        if s.weight > @student.weight
          @rank_list[0] = @rank_list[0] + 1
        end

        if s.height > @student.height
          @rank_list[1] = @rank_list[1] + 1
        end

        if s.gpa > @student.gpa
          @rank_list[2] = @rank_list[2] + 1
        end

        if s.gender == @student.gender
          @num_g = @num_g + 1
          if s.weight > @student.weight
            @rank_list_g[0] = @rank_list_g[0] + 1
          end
          if s.height > @student.height
            @rank_list_g[1] = @rank_list_g[1] + 1
          end
          if s.gpa > @student.gpa
            @rank_list_g[2] = @rank_list_g[2] + 1
          end
        end
      end
    end
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
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
      params.require(:student).permit(:name, :gender, :weight, :height, :color, :gpa)
    end
end

class StudentController < ApplicationController

  def index
    @students = Student.all.page(params[:page])
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(params_student)
    if @student.save
      redirect_to student_index_path, notice:
          "Novo aluno cadastrado com sucesso!"
    else
      render :new
    end
  end
end


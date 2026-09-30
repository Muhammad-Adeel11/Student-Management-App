class Api::StudentsController < ApplicationController

  def index
    students = Student.all

    render json: students
  end

  def show
    student = Student.find(params[:id])

    render json: student
  end

  def create
    student = Student.new(student_params)

    if student.save
      render json: student, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    student = Student.find(params[:id])

    if student.update(student_params)
      render json: student
    else
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy

    render json: { message: "Student deleted successfully" }
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :phone)
  end

end
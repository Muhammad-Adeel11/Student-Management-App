class StudentsController < ApplicationController

  skip_forgery_protection only: [:create, :update, :destroy]

def index
  @students = Student.page(params[:page]).per(2)
end

def show
  @student = Student.find(params[:id])

  respond_to do |format|
    format.html
    format.pdf do
      pdf = Prawn::Document.new

      pdf.text "Student Report", size: 24, style: :bold
      pdf.move_down 20

      pdf.text "ID: #{@student.id}"
      pdf.text "Name: #{@student.name}"
      pdf.text "Email: #{@student.email}"
      pdf.text "Phone: #{@student.phone}"

      send_data pdf.render,
                filename: "student_#{@student.id}.pdf",
                type: "application/pdf",
                disposition: "inline"
    end
  end
end

def students_pdf
  students = Student.all

  pdf = Prawn::Document.new

  pdf.text "All Students Report", size: 24, style: :bold
  pdf.move_down 20

  students.each do |student|
    pdf.text "ID: #{student.id}"
    pdf.text "Name: #{student.name}"
    pdf.text "Email: #{student.email}"
    pdf.text "Phone: #{student.phone}"

    pdf.move_down 15
    pdf.stroke_horizontal_rule
    pdf.move_down 15
  end

  send_data pdf.render,
            filename: "all_students.pdf",
            type: "application/pdf",
            disposition: "inline"
end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

def create
  @student = Student.new(student_params)

  if @student.save
    StudentMailer.student_created(@student).deliver_now
    redirect_to students_path
  else
    render :new
  end
end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :phone)
  end
end
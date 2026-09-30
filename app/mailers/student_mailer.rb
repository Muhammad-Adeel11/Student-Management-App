class StudentMailer < ApplicationMailer
  def student_created(student)
    @student = student

    mail(
      to: @student.email,
      subject: "Student Registration Successful"
    )
  end
end
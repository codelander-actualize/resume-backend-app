class Api::StudentsController < ApplicationController
  before_action :authenticate_student, except: [:index, :show]
  def index
    @students = Student.all
    render 'index.json.jbuilder'
  end

  def show
    if current_student
      @student = current_student
    else
      @student = Student.find(params[:id])
    end
    render 'show.json.jbuilder'
  end

  def create
    @student = Student.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone_number: params[:phone_number],
    short_bio: params[:short_bio],
    linkedin_url: params[:linkedin_url],
    twitter_handle: params[:twitter_handle],
    personal_blog: params[:personal_blog],
    online_resume_url: params[:online_resume_url],
    github_url: params[:github_url],
    photo_url: params[:photo_url],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
    if @student.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @student = current_student
    @student.first_name = params[:first_name] || @student.first_name
    @student.last_name = params[:last_name] || @student.last_name
    @student.email = params[:email] || @student.email
    @student.phone_number = params[:phone_number] || @student.phone_number
    @student.short_bio = params[:short_bio] || @student.short_bio
    @student.linkedin_url = params[:linkedin_url] || @student.linkedin_url
    @student.twitter_handle = params[:twitter_handle] || @student.twitter_handle
    @student.personal_blog = params[:personal_blog] || @student.personal_blog
    @student.online_resume_url = params[:online_resume_url] || @student.online_resume_url
    @student.github_url = params[:github_url] || @student.github_url
    @student.photo_url = params[:photo_url] || @student.photo_url
    if @student.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @student = current_student
    @student.destroy
    render json: {message: "User successfully destroyed"}
  end
end

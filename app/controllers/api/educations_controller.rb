class Api::EducationsController < ApplicationController

  def index
    @educations = Education.all
    render 'index.json.jbuilder'
  end

  def show
    @education = Education.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @education = Education.new(
    start_date: params[:start_date],
    end_date: params[:end_date],
    degree: params[:degree],
    university_name: params[:university_name],
    details: params[:details],
    student_id: params[:student_id]
    )
    if @education.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @education.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @education = Education.find(params[:id])
    @education.start_date = params[:start_date] || @education.end_date
    @education.end_date = params[:end_date] || @education.degree
    @education.degree = params[:degree] || @education.university_name
    @education.university_name = params[:university_name] || @education.start_date
    @education.details = params[:details] || @education.details

    if @education.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @education.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy

    render json: {message: "BOOM!!! Education successfully destroyed"}
  end
end

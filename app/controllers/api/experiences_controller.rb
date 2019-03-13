class Api::ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all 
    render 'index.json.jbuilder'
  end

  def show
    @experience = Experience.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @experience = Experience.new(
      start_date: params[:start_date],
      end_date: params[:end_date],
      job_title: params[:job_title],
      company_name: params[:company_name],
      details: params[:details],
      )
    if @experience.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @student.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.start_date = params[:start_date] || @experience.start_date
    @experience.end_date = params[:end_date] || @experience.end_date
    @experience.job_title = params[:job_title] || @experience.job_title
    @experience.company_name = params[:company_name] || @experience.company_name
    @experience.details = params[:details] || @experience.details
    if @experience.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @student.errors.full_messages}, status: :unprocessable_entity
    end
  end

end

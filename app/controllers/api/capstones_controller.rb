class Api::CapstonesController < ApplicationController
  def index
    @capstones = Capstone.all
    render 'index.json.jbuilder'
  end

  def show
    @capstone = Capstone.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @capstone = Capstone.new(
      name: params[:name],
      description: params[:description],
      url: params[:url],
      image_url: params[:image_url],
      student_id: params[:student_id]
      )
    if @capstone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @capstone = Capstone.find(params[:id])
    @capstone.name = params[:name] || @capstone.name
    @capstone.description = params[:description] || @capstone.description
    @capstone.url = params[:url] || @capstone.url
    @capstone.image_url = params[:image_url] || @capstone.image_url
    @capstone.student_id = params[:student_id] || @capstone.student_id
    if @capstone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @capstone.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @capstone = Capstone.find(params[:id])
    @capstone.destroy
    render json: {message: "capstone destroyed"}
  end
end

class Api::SkillsController < ApplicationController

  def index
    @skills = Skill.all
    render 'index.json.jbuilder'
  end

  def show
    @skill = Skill.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @skill = Skill.new(
      skill_name: params[:skill_name]
      # student_id: current_student

    )

    if @skill.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @skill.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.skill_name = params[:skill_name] || @skill.skill_name

    if @skill.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @skill.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    render json: {message: "BOOM! That skill is out of there!"}
  end
end

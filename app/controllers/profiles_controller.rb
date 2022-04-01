# frozen_string_literal: true

# Profiles Controller
class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def delete
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :description, :email, :work, :age)
  end
end

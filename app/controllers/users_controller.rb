# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    # redirect to login page if not logged in
    return redirect_to new_user_session_url if current_user.nil? || current_user.id != params[:id].to_i

    @publications = Publication.where(user_id: current_user.id).all
    @user = current_user
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
end

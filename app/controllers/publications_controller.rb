# frozen_string_literal: true

class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
    @comments = {}
    @publications.each do |publication|
      @comments[publication.id] = publication.comments.order(created_at: :desc)
    end
  end

  def show
    @publication = Publication.find(params[:id])
    @comments = @publication.comments.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user
    if @publication.save
      redirect_to publications_path
    else
      render :new
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to publications_path
    else
      render :edit
    end
  end

  def delete
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to publications_path
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :content)
  end
end

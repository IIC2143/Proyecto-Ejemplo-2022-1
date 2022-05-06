# frozen_string_literal: true

# offers controller
class OffersController < ApplicationController
  def new
    @offer = Comment.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to publications_path(@offer.publication)
    else
      render :new
    end
  end

  def delete
    @offer = Comment.find(params[:id])
    @id_publication = @offer.publication
    @offer.destroy
    redirect_to publications_path(@id_publication)
  end

  # def offer_params
  #     params.require(:offer).permit(:content)
  # end
end

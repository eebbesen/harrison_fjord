# frozen_string_literal: true

##
class ThumbnailsController < ApplicationController
  def show
    @results = Link.all.order(:url)
  end

  def destroy
    to_delete = params['markedForDelete']
    to_delete.split(',').map { |l| Link.destroy l unless l.to_i.negative? }
    @results = StaticPagesController.new.send(:pictures)
    redirect_to t_url
  end
end

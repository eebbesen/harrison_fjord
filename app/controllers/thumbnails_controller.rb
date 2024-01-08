# frozen_string_literal: true

##
class ThumbnailsController < ApplicationController
  def show
    @results = Link.order(:url)
    @dk = params['dk']
  end

  def destroy
    if params['deleteKey'].nil? || params['deleteKey'] != ENV['DELETE_KEY']
      logger.info "Attempt to delete with invalid key: ${params['deleteKey']}"
      return false
    end

    to_delete = params['markedForDelete']
    to_delete.split(',').map { |l| Link.destroy l unless l.to_i.negative? }
    @results = StaticPagesController.new.send(:pictures)
    redirect_to t_url
  end
end

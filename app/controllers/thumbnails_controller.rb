# frozen_string_literal: true

class ThumbnailsController < ApplicationController
  def show
    @results = Link.all.order(:url)
  end

  def destroy
    puts "key: #{ENV['DELETE_KEY']}"

    if params['deleteKey'].nil? || params['deleteKey'] != ENV['DELETE_KEY']
      logger.info "Attempt to delete with invalid key: ${params['deleteKey']}"
      return false
    end

    to_delete = params['markedForDelete']
    to_delete.split(',').map { |l| Link.destroy l unless l.to_i < 0 }
    @results = StaticPagesController.new.send(:pictures)
    redirect_to t_url
  end
end

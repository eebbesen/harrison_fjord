class ThumbnailsController < ApplicationController
  def show
    @results ||= StaticPagesController.new.send(:pictures)
  end
end
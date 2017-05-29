class ThumbnailsController < ApplicationController
  def show
    @results ||= StaticPagesController.new.send(:pictures)
  end

  def destroy
    byebug
  end

  def get
    byebug
  end

  def post
    byebug
  end
end
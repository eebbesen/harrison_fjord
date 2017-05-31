class ThumbnailsController < ApplicationController
  def show
    @results = Link.all
  end

  def destroy
    to_delete = params['markedForDelete']
    to_delete.split(',').map { |l| Link.destroy l unless l.to_i < 0 }
    @results = StaticPagesController.new.send(:pictures)
    redirect_to t_url
  end
end

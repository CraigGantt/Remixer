#copied from the book, modified for remixer
class PlayController < ApplicationController
  skip_before_filter
  def index
    @songs = Song.order(:title)
  end
end

#copied from the book
class AdminController < ApplicationController
  def index
    @total_songs = Song.count
  end
end

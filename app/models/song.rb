#copied from the book, modified for remixer
class Song < ActiveRecord::Base
  validates :title, :artist, :description, :file, :length, presence: true
  validates :length, numericality: {greater_than_or_equal_to: 1}
  validates :file, uniqueness: true
  validates :file, allow_blank: false, format: {
    with:    %r{\.(wav)$}i,
    message: 'must be an WAV file.'
  }
end

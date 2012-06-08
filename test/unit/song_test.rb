require 'test_helper'
#copied (and modified slightly) from the book.
class SongTest < ActiveSupport::TestCase
  fixtures :songs
  # test "the truth" do
  #   assert true
  # end
  test "song attributes must not be empty" do
    song = Song.new
    assert song.invalid?
    assert song.errors[:title].any?
    assert song.errors[:artist].any?
    assert song.errors[:description].any?
    assert song.errors[:file].any?
    assert song.errors[:length].any?
  end
  test "song length must be positive" do
    song = Song.new(title:            'Emotionless',
                    artist:           'GC',
                    description:      'Emo.',
                    file:             'Unique.wav',)
    song.length = -1
    assert song.invalid?
    assert_equal "must be greater than or equal to 1",
      song.errors[:length].join('; ')

    song.length = 0
    assert song.invalid?
    assert_equal "must be greater than or equal to 1",
      song.errors[:length].join('; ')

    song.length = 1
    assert song.valid?, "Should be valid"
  end
  def new_song(file)
    Song.new(title:       'Unnamed',
             artist:      'Unknown',
             description: 'Cannot Tell',
             file:        file,
             length:      1)
  end
  test "file" do
    ok = %w{ fred.wav FRED.WAV }
    bad = %w{ fred.flac fred.mpeg fred.mp3 fred.wma}
    ok.each do |name|
      assert new_song(name).valid?, "#{name} shouldn't be invalid"
    end
    bad.each do |name|
      assert new_song(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  test "song is not valid without a unique file - i18n" do
    song = Song.new(title:       "dummy",
                    artist:      "xxx",
                    description: "yyy",
                    file:        songs(:ruby).file,
                    length:      1)
    assert !song.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
      song.errors[:file].join('; ')
  end
end

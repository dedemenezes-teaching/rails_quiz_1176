class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song) # NEW HTTP REQUEST IS TRIGGERED
    else
      render :new, status: :unprocessable_entity # NO NEW HTTP REQUEST IS MADE
    end
  end

  # read all
  def index
    @songs = Song.all
  end

  # read one
  def show
    @song = Song.find(params[:id])
  end

  def search
    # raise
    # params { query: 'thriller' }
    # @songs = Song.where(title: params[:query])
    # SELECT * FROM songs WHERE title = ???
    # Song.where('title ILIKE ?', params[:query]) # CASE INSENSITIVE not on SQLite
    # @songs = Song.find_by(title: params[:query]) # BRINGS BACK ONE!

    @songs = Song.where(title: params[:name])
  end

  private

  def song_params
    # "song"=>{"title"=>"", "year"=>""}
    params.require(:song).permit(:title, :year)
  end
end

class SongsController < ApplicationController
  def index
    songs = Song.all

    render json: songs.as_json
  end

  def show
    song = Song.find_by(id: params["id"])
    render json: song.as_json
  end

  def create
    song = Song.create(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"],
      lyrics: params["lyrics"],
    )
    render json: song.as_json
  end

  def update
    song = Song.find_by(id: params["id"])

    song.title = params["title"] || song.title
    song.album = params["album"] || song.album
    song.artist = params["artist"] || song.artist
    song.year = params["year"] || song.year
    song.lyrics = params["lyrics"] || song.lyrics

    render json: song.as_json
  end

  def destroy
    song = Song.find_by(id: params["id"])
    song.destroy
    render json: { message: "#{song.title} has been deleted." }
  end
end

class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update]
    
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show

    end

    def edit
        
    end

    def update
        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    private

    def set_song
        @song = Song.find_by(id: params[:id])
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end

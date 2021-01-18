class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update]
    
    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        if @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @artist.update(artist_params)
            redirect_to artist_path(@artist)
        else
            render :edit
        end
    end

    private

    def set_artist
        @artist = Artist.find_by(id: params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end

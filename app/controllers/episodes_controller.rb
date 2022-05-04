class EpisodesController < ApplicationController

    before_action :find_episode, only: [:show, :destroy]

    def index
        render json: Episode.all
    end

    def show
        render json: @episode, serializer: EpisodeWithGuestsSerializer
    end

    def destroy
        @episode.destroy
        head :no_content
    end

    private

    def find_episode
        @episode = Episode.find(params[:id])
    end
end

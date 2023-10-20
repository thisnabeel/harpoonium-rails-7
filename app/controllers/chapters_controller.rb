class ChaptersController < ApplicationController

    def show
        @chapter = Chapter.find(params[:id])
    end

    def sample
        # Your controller logic here
        @chapters = Chapter.all.sample(5).shuffle
    end
end
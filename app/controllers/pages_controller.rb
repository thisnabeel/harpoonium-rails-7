class PagesController < ApplicationController

    def home

        if !user_signed_in?
            return redirect_to "/sign_in"
        end

        @quizzes = current_user.quizzes.sample(5).shuffle
    end


end

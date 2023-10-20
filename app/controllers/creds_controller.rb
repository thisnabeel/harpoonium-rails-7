class CredsController < ApplicationController
    def sign_in
        if user_signed_in?
            redirect_to "/"
        end
        @user = User.new
    end

    def sign_up

        @user = User.new
    end
end

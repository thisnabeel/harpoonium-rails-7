# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_signed_out_user
  
  # GET /resource/sign_in
  # def new
  #   super
  # end
  def sign_up
    user = User.create(user_params)
    generated_token = user.generate_temporary_authentication_token
    render json: user.attributes.merge(
      :admin => user.admin?, 
      generated_token: generated_token, 
    )
  end

  # POST /resource/sign_in
  def create
      u = params[:user]
      user = User.find_by(email: u[:login]) || User.find_by(username: u[:login])


      if user.present? && user.valid_password?(u[:password])
        puts "WE ARE IN"
        generated_token = user.generate_temporary_authentication_token

        respond_to do |format|
          format.html {
            sign_in(:user, user)
            redirect_to "/"
          }

          format.json {
            render json: user.attributes.merge(
              :admin => user.admin?, 
              generated_token: generated_token, 
            )
          }
        end
        # user.generate_temporary_authentication_token
        # render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
      else
        head(:unauthorized)
      end

  end

  # DELETE /resource/sign_out
  def destroy
    respond_to do |format|
      format.html {
        sign_out(current_user)

        puts "redirection: current: #{current_user}"
        redirect_to after_sign_out_path_for(:user),  status: :see_other, turbo_frame: "_top"

      }
      format.json {
        if request.headers['X-User-Token'].present?
          user = User.find_by(email: request.headers['X-User-Email'])
          if !user.present?
            puts "USER IS NOT PRESENT"
            render json: []
            return
          end
          token = request.headers['X-User-Token']
          user.update(tokens: user.tokens - [token])
          render json: user.tokens
        end
      }


    end
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit!
    end
end

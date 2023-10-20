class AuthController < ApplicationController
  def signin_form
    @user = User.new(session[:user_params])
    # render html: '<div>html goes here</div>'.html_safe
    render partial: 'shared/signin_form', locals: { user: @user }, status: :see_other
  end

  def signup_form
    @user = User.new(session[:user_params])
    render partial: 'shared/signup_form', locals: { user: @user }, status: :see_other
  end
end
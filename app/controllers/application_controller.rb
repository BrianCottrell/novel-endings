class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :path_finder
  $current_story  = ['first', 'second', 'third', 'fourth', 'fifth'].shuffle.first
  def current_user
  	@current_user ||= User.where(id: session[:user_id]).first
  end
  def path_finder
    if $current_story == 'second'
      return second_story_texts_path
    elsif $current_story == 'third'
      return third_story_texts_path
    elsif $current_story == 'fourth'
      return fourth_story_texts_path
    elsif $current_story == 'fifth'
      return fifth_story_texts_path
    else
      return first_story_texts_path
    end
  end
end

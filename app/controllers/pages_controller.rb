class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    redirect_to colocation_path(current_colocation) unless current_user.nil?
  end
end

class Api::V1::PostsController < ApplicationController

  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session
  
  def index
     end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end


end

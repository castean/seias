class LettersController < ApplicationController
  load_and_authorize_resource
  def index
    @letters = Letter.all
  end

  def show
    @letter = Letter.find(params[:id])
  end
end

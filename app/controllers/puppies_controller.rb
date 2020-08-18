class PuppiesController < ApplicationController
  def new
    @puppy = Puppy.new
  end

  def create
  end

  def index
    @puppies = Puppy.all
  end

  def show
    @puppy = Puppy.find(params[:id])
  end

end

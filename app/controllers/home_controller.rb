class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :new]
  def index
    @posts = Post.all
  end
  def new
  end
  def edit
  end
end

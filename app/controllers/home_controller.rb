class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :new]
  def index
  end
  def new
  end
  def edit
  end
end

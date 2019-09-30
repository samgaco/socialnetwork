# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def index
    @users = User.all
    @friendship = Friendship.new
    @friendships = Friendship.all
  end

  def show; end
end

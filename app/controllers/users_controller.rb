class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.where({ :id => params.fetch("id") }).at(0)

    @photos = @user.own_photos.order({ :created_at => :desc })

    render("user_templates/show.html.erb")
  end

  def liked_photos
    @user = User.where({ :id => params.fetch("id") }).at(0)

    @photos = @user.liked_photos.order({ :created_at => :desc })

    render("user_templates/liked.html.erb")
  end

  def feed
    @user = User.where({ :id => params.fetch("id") }).at(0)

    @photos = @user.feed.order({ :created_at => :desc })

    render("user_templates/feed.html.erb")
  end

  def discover
    @user = User.where({ :id => params.fetch("id") }).at(0)

    @photos = @user.discover.order({ :created_at => :desc })

    render("user_templates/discover.html.erb")
  end

  def followers
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("user_templates/followers.html.erb")
  end

  def following
    @user = User.where({ :id => params.fetch("id") }).at(0)

    render("user_templates/following.html.erb")
  end
end

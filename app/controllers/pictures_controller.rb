class PicturesController < ApplicationController
  def recent
    @photos = Photo.all.order({ :created_at => :desc }).limit(25)

    render("pic_templates/time_list.html.erb")
  end

  def most_liked
    @photos = Photo.all.order({ :likes_count => :desc }).limit(25)

    render("pic_templates/liked_list.html.erb")
  end

  def show_details
    photo_id = params.fetch("some_id")

    @pic = Photo.where({ :id => photo_id }).at(0)

    render("pic_templates/details.html.erb")
  end

  def byebye
    pic = Photo.where({ :id => params.fetch("toast_id") }).at(0)

    pic.destroy

    redirect_to("/popular")
  end

  def blank_form
    render("pic_templates/new_record_form.html.erb")
  end

  def save_new_row
    picture = Photo.new
    picture.image = params.fetch("pic_image")
    picture.caption = params.fetch("pic_caption")
    picture.owner_id = params.fetch("poster_id")

    picture.save

    redirect_to("/recent")
  end

  def filled_in_form
    @old_photo = Photo.where({ :id => params.fetch("fill_in_id") }).at(0)

    render("pic_templates/existing_record_form.html.erb")
  end

  def save_old_row
    picture = Photo.where({ :id => params.fetch("modify_id") }).at(0)
    picture.image = params.fetch("pic_image")
    picture.caption = params.fetch("pic_caption")

    picture.save

    redirect_to("/photos/" + picture.id.to_s)
  end
end

class CommentsController < ApplicationController
  def save_new_row
    comment = Comment.new
    comment.photo_id = params.fetch("picture_id")
    comment.author_id = params.fetch("commenter_id")
    comment.body = params.fetch("comment_text")

    comment.save

    photo = Photo.where({ :id => comment.photo_id }).at(0)
    photo.comments_count = photo.comments_count + 1
    photo.save

    redirect_to("/photos/" + comment.photo_id.to_s)
  end
end

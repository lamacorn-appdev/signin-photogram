Rails.application.routes.draw do
  devise_for :users
  match("/", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/recent", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/popular", { :controller => "pictures", :action => "most_liked", :via => "get" })

  match("/photos/:some_id", { :controller => "pictures", :action => "show_details", :via => "get" })

  match("/users", { :controller => "users", :action => "index", :via => "get" })

  match("/users/:id", { :controller => "users", :action => "show", :via => "get" })

  match("/users/:id/liked", { :controller => "users", :action => "liked_photos", :via => "get" })

  match("/users/:id/feed", { :controller => "users", :action => "feed", :via => "get" })

  match("/users/:id/discover", { :controller => "users", :action => "discover", :via => "get" })

  match("/users/:id/followers", { :controller => "users", :action => "followers", :via => "get" })

  match("/users/:id/following", { :controller => "users", :action => "following", :via => "get" })

  match("/delete_photo/:toast_id", { :controller => "pictures", :action => "byebye", :via => "get" })

  match("/new_photo_form", { :controller => "pictures", :action => "blank_form", :via => "get" })

  match("/create_photo_record", { :controller => "pictures", :action => "save_new_row", :via => "get" })

  match("/existing_photo_form/:fill_in_id", { :controller => "pictures", :action => "filled_in_form", :via => "get" })

  match("/update_photo_record/:modify_id", { :controller => "pictures", :action => "save_old_row", :via => "get" })

  match("/create_comment_record", { :controller => "comments", :action => "save_new_row", :via => "get" })

  match("/create_like_record", { :controller => "likes", :action => "save_new_row", :via => "get" })

  match("/create_follow_request_record", { :controller => "follow_requests", :action => "save_new_row", :via => "get" })

  match("/update_follow_request_record/:modify_id", { :controller => "follow_requests", :action => "save_old_row", :via => "get" })

  # The routes below are for the ActiveAdmin dashboard located at /admin. You can ignore them.
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

module PostsHelper

  def display_image
    current_user.profile_photo
  end
end

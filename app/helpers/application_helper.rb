module ApplicationHelper

  def show_avatar(user)
    if user.avatar?
      image_tag(user.avatar, class: 'avatar-circle')
    else
      render partial: 'devise/avatar'
    end
  end
end

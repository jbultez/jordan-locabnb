module ApplicationHelper

  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url
    else
      'default_image.png'
    end
  end

  def fullname(room)
    return "#{@room.user.lastname.capitalize} #{@room.user.firstname.capitalize}"
  end

end

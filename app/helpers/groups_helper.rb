module GroupsHelper
  def group_image?(group)
    if group.image?
      "#{group.image.url}"
    else
      return "default.jpg"
    end
  end
end

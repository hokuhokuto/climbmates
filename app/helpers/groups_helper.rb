module GroupsHelper
  def image?(group)
    if group.image?
      "#{group.image.url}"
    else
      return "default.jpg"
    end
  end
  
  def owner_or_join_wish_user?
    if @group.user == current_user && @join_wish_users != nil
      true
    else
      false
    end
  end
  
end

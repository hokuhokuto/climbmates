module GroupsHelper
  def image?(group)
    if group.image?
      "#{group.image.url}"
    else
      return "default.jpg"
    end
  end
  
  def col_size_6to4
    if @group.user == current_user && @join_wish_users != nil
      return "col-xs-4"
    else
      return "col-xs-6"
    end
  end
end

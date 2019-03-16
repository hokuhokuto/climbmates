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
  
  
  def current_user_joined?(event)
    if event.group.group_relationships.find_by(user_id: current_user.id)
      if event.group.group_relationships.find_by(user_id: current_user.id).approval == "approvaled"
        return true
      else
        return false
      end
    else
      return false
    end
  end
        
end

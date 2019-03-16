# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
names = ["nakata","hokuto","masaru","takiko","shusaku","mami","tamie","takaaki","minoru"]

names.each do |name|
  user = User.new
  user.name = "#{name}"
  user.email = "#{name}@gmail.com"
  user.password = "12barblues"
  user.comment = "#{name}と申します。よろしくお願いします。"
  user.save
end

names.each_with_index do |name,i|
  group = Group.new
  group.user_id = i + 1
  group.name = "チーム#{name}"
  group.info = "#{name}主催のグループです"
  group.save
end

length = names.length + 1

(1..length).each do |group_id|
  (1..length).each do |user_id|
    group_relationship = GroupRelationship.new
    group_relationship.group_id = group_id
    group_relationship.user_id = user_id
    if group_id == user_id || group_id + 1 == user_id
      group_relationship.approval = "approvaled"
    else
      group_relationship.approval = "pending"
    end
    group_relationship.save
  end
end

(1..length).each do |group_id|
  (1..3).each do |user_id|
    event = Event.new
    event.group_id = group_id
    event.user_id = user_id
    event.title = "#{names[user_id - 1]}主催の登山"
    event.content = "春だし山に登ろう"
    event.date = "2019/3/16"
    event.save
  end
end    
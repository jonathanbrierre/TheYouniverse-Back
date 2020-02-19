# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Like.destroy_all
Post.destroy_all
User.destroy_all
Topic.destroy_all


t1 = Topic.create(name: 'tamales')

u1 = User.create(username: 'motorolla', password: 'choochoo')

p1 = Post.create(topic: t1, user: u1, content: 'hohoho merry christmas')
p2 = Post.create(topic: t1, user: u1, content: 'this is post 2')
p3 = Post.create(topic: t1, user: u1, content: 'i like women with big minds')

l1 = Like.create(user: u1, post: p1)
c1 = Comment.create(user: u1, post: p1)


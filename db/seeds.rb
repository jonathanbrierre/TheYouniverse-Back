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
Following.destroy_all


t1 = Topic.create(name: 'Spirituality', slug: 'spirituality')
t2 = Topic.create(name: 'Love and Relationships', slug: 'love')
t3 = Topic.create(name: 'Discipline', slug: 'discipline')
t4 = Topic.create(name: 'Philosophy', slug: 'philosophy')
t5 = Topic.create(name: 'Positivity', slug:'positivity')


u1 = User.create(username: 'motorolla', password: 'choochoo', first_name: 'moto', last_name:'rolla', email: 'moto@rolla.com', bio: 'ring ring, im a telephone', avatar: 'https://www.buytwowayradios.com/media/catalog/product/cache/2/thumbnail/800x/9df78eab33525d08d6e5fb8d27136e95/t/8/t800_blue_front_0418_4834_2up_rhv1.jpg')
u2 = User.create(username: 'jonathanbrierre', first_name: 'jonathan', last_name: 'brierre', password: '123', gender: 'male', email: 'jay@yahoo.com', avatar: 'https://images-na.ssl-images-amazon.com/images/I/41FBm7PCIfL._US230_.jpg', bio: 'i like women with big minds')
u3 = User.create(username: 'someUser', first_name: 'some', last_name: 'user', password: '123', gender: 'male', email: 'jay2@yahoo.com', avatar: 'https://images-na.ssl-images-amazon.com/images/I/41FBm7PCIfL._US230_.jpg', bio: 'i like women with big minds')
u4 = User.create(username: 'someOtherUser', first_name: 'some other', last_name: 'user', password: '123', gender: 'male', email: 'jay3@yahoo.com', avatar: 'https://images-na.ssl-images-amazon.com/images/I/41FBm7PCIfL._US230_.jpg', bio: 'i like women with big minds')
p1 = Post.create(topic: t1, user: u1, content: 'hohoho merry christmas')
p2 = Post.create(topic: t1, user: u1, content: 'this is post 2')
p3 = Post.create(topic: t1, user: u1, content: 'i like women with big minds')

l1 = Like.create(user: u1, post: p1)
c1 = Comment.create(user: u1, post: p3, content: 'i do too')
c2 = Comment.create(user: u1, post: p3, content: 'yeah man')
c3 = Comment.create(user: u1, post: p3, content: 'totes magotes')
c4 = Comment.create(user: u1, post: p3, content: 'blue eyes purple people eater')
c5 = Comment.create(user: u1, post: p3, content: 'chocolate')
c6 = Comment.create(user: u1, post: p3, content: 'hohoho')
c7 = Comment.create(user: u1, post: p3, content: 'bush did 911')
c8 = Comment.create(user: u1, post: p3, content: 'food')
c9 = Comment.create(user: u1, post: p3, content: 'yeahyeahyeah')

f1 = Following.create( user_id: u2.id, followee_id: u1.id)
f2 = Following.create( user_id: u2.id, followee_id: u3.id)
f3 = Following.create( user_id: u2.id, followee_id: u4.id)
f4 = Following.create( user_id: u1.id, followee_id: u2.id)
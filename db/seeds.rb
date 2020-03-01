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
Conversation.destroy_all
Message.destroy_all


t1 = Topic.create(name: 'Spirituality', slug: 'spirituality', img: ' https://cdn.pixabay.com/photo/2017/01/23/09/20/wave-2001831_960_720.jpg')
t2 = Topic.create(name: 'Love', slug: 'love', img: 'https://whoabella.com/wp-content/uploads/2019/05/love.jpg')
t3 = Topic.create(name: 'Philosophy', slug: 'philosophy', img: 'http://arts.u-szeged.hu/site/upload/2018/08/raphael_school_of_athens2.jpg')
t4 = Topic.create(name: 'Positivity', slug:'positivity', img: 'https://ak4.picdn.net/shutterstock/videos/9357944/thumb/1.jpg')


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

con1 = Conversation.create(user_id: u2.id, conversee_id: u1.id)
con2 = Conversation.create(user_id: u2.id, conversee_id: u3.id)
con3 = Conversation.create(user_id: u4.id, conversee_id: u2.id)


m1 = Message.create(user: u2, conversation: con1, content: 'hello')
m2 = Message.create(user: u2, conversation: con1, content: 'how are you')
m3 = Message.create(user: u1, conversation: con1, content: 'hello')

m4 = Message.create(user: u3, conversation: con2, content: 'potate')
m5 = Message.create(user: u3, conversation: con2, content: 'hahaho')
m6 = Message.create(user: u2, conversation: con2, content: 'lalaaa')
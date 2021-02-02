`PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin`
# the above is needed for cronjob
#
# ca 200 follower per month

#require_relative '../bin/mogen'
require_relative 'session'
require_relative 'user'
#require_relative 'tag'

# top hashtags https://websta.me/hot
# tag_names = %w(flamingofloat flamingo flamingos flamingofloats floaties flamingopink flamingopoolparty pool river beer tropical)


#worked good:
#  love
#  instagood
#  photooftheday
#  fashion
#  beautiful
#  happy
#  cute
#  tbt
#  like4like
#  followme
#  picoftheday
#  follow
#  selfie
#  art
#  summer
#  instadaily
#  friends
#  repost
#  nature
#  girl
#  fun
#  style
#  smile
#  food
#  travel
#  likeforlike
#  family
#  fitness
#  follow4follow
#  igers
#  beauty
#  tagsforlikes
#  life
#  nofilter
tag_names = %w(
  FashionPhoto
  FashionInfluencer
  FashionDaily
  StyleInspiration
  Clothes
  Urbanstyle
  DressedUp
  StyleBlog
  Fashionstylist
  makeupturorial
  makeupgoals
  makeupidea
  makeuplove
  glammakeup
  mua
  makeuppro
  makeuptransformatio
  makeuptime
  makeuptutorial 
  eyeshadowlooks
  makeuplooks
  makeup
  beautybloggers
  beautytips
  muasfeaturing
  photoshoot
  photo
  session
  photomodel
  fashion
  love
  beautiful 
)
 # amazing
  #instalike
  #me
# tag namess optional
# @session = Session.new(tag_names)
#
#
# TODO what if there is no load more?
#  birthday
#  red
#  workout
#  sweet
#  wedding
#  blackandwhite
#  fit
#  instafood
#  instasize
#  flowers
#  iphonesia
#  tweetgram
#  design
#  instafollow
#  my
#  webstagram
#  christmas

users = User.all
users.each do |user|
  puts user.username
  @session = Session.new(tag_names, user)
  @session.login
  @session.like_tags
  #@session.comment_tags
end

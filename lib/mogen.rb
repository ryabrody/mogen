`PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin`
# the above is needed for cronjob

#require_relative '../bin/mogen'
require_relative 'session'
require_relative 'user'
#require_relative 'tag'

# top hashtags https://websta.me/hot
# tag_names = %w(flamingofloat flamingo flamingos flamingofloats floaties flamingopink flamingopoolparty pool river beer tropical)


tag_names = %w(
  love
  instagood
  photooftheday
  fashion
  beautiful
  happy
  cute
  tbt
  like4like
  followme
  picoftheday
  follow
  me
  selfie
  art
  summer
  instadaily
  friends
  repost
  nature
  girl
  fun
  style
  smile
  food
  instalike
  travel
  likeforlike
  family
  fitness
  follow4follow
  igers
  beauty
  tagsforlikes
  life
  nofilter
  amazing
)
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

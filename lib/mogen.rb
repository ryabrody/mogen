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
  beautiful
  fashion
  happy
  tbt
  cute
  followme
  like4like
  follow
  me
  picoftheday
  selfie
  summer
  instadaily
  friends
  art
  girl
  repost
)
# tag namess optional
# @session = Session.new(tag_names)
#
#
# TODO what if there is no load more?:
user = User.all.first
@session = Session.new(tag_names)
@session.login(user)
@session.like_tags

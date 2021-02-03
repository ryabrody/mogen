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


#users = User.all
##users = ['a', 'b'] 
#users.each do |user|
#  ractor = Ractor.new do
#    run(receive)
#    #user_in_ractor = receive # receive blocks till somebody will pass message
#    #puts "I am in Ractor! a=#{user_in_ractor}"
#  end
#
#  session = Session.new(user.tag_names, user)
#
#  ractor.send(session)  # pass it
#  ractor.take
#end

users = User.all
users.each do |user|
  puts user.username
  @session = Session.new(user.tag_names, user)
  @session.login
  @session.like_tags
  #@session.comment_tags
end

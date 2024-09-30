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

#threads = []
#
#users = User.all
#users.each do |user|
#  threads << Thread.new do
#    puts user.username
#    @session = Session.new(user.tag_names, user)
#    @session.login
#    @session.like_tags
#    #@session.comment_tags
#  end
#end
#threads.map(&:join)

#####def new_ractor(session)
#####  r = Ractor.new do
#####    session_in_ractor = receive
#####    puts "User name: #{session_in_ractor.user.username}"
#####    #puts user_in_ractor.username
#####    #@session = Session.new(user_in_ractor.tag_names, user_in_ractor) # i think u need to do  suser and session object and provide both to the ractor
#####    #@session.login
#####    #@session.like_tags
#####    #@session.comment_tags
#####  end
#####  binding.pry
#####  r.send(session)
#####end
#####
#####
#####
#####users = User.all
#####sessions = []
#####ractors = []
#####
#####users.each do |user|
#####  sessions << Session.new(user.tag_names, user)
#####end
#####sessions.each do |session|
#####  ractors << new_ractor(session)
#####end
#####ractors.each(&:take)


users = User.all
users.each do |user|
  puts user.username
  @session = Session.new(user.tag_names, user)
  @session.login
  @session.like_tags
  #@session.comment_tags
end

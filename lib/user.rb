class User
  attr_reader :username, :password, :tag_names

  def initialize(params = {})
    @username = params[:username]
    @password = params[:password]
    @tag_names = params[:tag_names]
  end

  def self.all
    YAML.load_file('users.yml').map do |user|
      new(
        username: user['username'],
        password: user['password'],
        tag_names: user['tag_names'],
      )
    end
  end
end

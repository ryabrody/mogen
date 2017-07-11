class User
  attr_reader :username, :password

  def initialize(params = {})
    @username = params[:username]
    @password = params[:password]

  end

  def self.all
    YAML.load_file('users.yml').map do |user|
      new(username: user['username'], password: user['password'])
    end
  end
end

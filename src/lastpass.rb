require 'json'

module LastPass
  def LastPass.login(email)
    Login.new(email)
  end

  class Login < Struct.new(:email)
    def account(account)
      sudo { JSON.parse(`lpass show --json #{account}`, symbolize_names: true).first }
    end

    def sudo
      `lpass login --trust #{email}` unless `lpass status`.include?(email)
      yield
    end
  end
end

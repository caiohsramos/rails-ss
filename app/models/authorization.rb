# frozen_string_literal: true

class Authorization
  include Singleton

  attr_accessor :username, :password

  def self.setup
    yield instance
  end

  def valid?(username, password)
    secure_compare(username, self.username) && secure_compare(password, self.password)
  end

  private

  def secure_compare(...)
    ActiveSupport::SecurityUtils.secure_compare(...)
  end
end

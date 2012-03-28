class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :username, :password, :password_confirmation, :role
  ROLES = %w[guest geek moderator admin superadmin]

  def role?(base_role)
       ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end

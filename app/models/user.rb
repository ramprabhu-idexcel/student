class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :timeoutable

  ROLES = %w[administrator professor student]

 validates :first_name, :last_name, :role, :phone_number, presence:  true

 has_and_belongs_to_many :courses

  def admin?
    self.role.to_sym == :administrator
  end

  def professor?
    self.role.to_sym == :professor
  end

  def set_role
    if self.admin?
      ROLES
    elsif self.professor?
      %w[student]
    end
  end
end

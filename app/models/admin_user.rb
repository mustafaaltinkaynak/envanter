class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def password_required?
    provider.present? ? false : super
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first
    return unless user.present?
    user.update_attributes provider: auth.provider,
                           uid:      auth.uid,
                           email:    auth.info.email
    user.name ||= auth.info.name
    user
  end
end

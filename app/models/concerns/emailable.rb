module Emailable
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true, length: { maximum: 100 },
              format: { with: URI::MailTo::EMAIL_REGEXP },
              uniqueness: { case_sensitive: false }

    before_save do
      self.email = email.strip.downcase
    end
  end
end
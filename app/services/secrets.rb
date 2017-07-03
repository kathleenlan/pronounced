# This class is responsible for extracting values from the secrets file for the
# relevant Rails environment.
class Secrets
  def self.recaptcha_site_key
    secrets_for_environment['recaptcha_site_key']
  end

  def self.recaptcha_secret
    secrets_for_environment['recaptcha_secret']
  end

  def self.secrets_for_environment
    YAML.load(File.open('config/secrets.yml'))[Rails.env]
  end
end

class RecaptchaVerifier
  # @param response [String] the g-recaptcha-response parameter that is included
  #    in request params when a user submits a form that uses recaptcha.
  def initialize(response)
    @response = response
  end

  def verify
    uri = URI(verification_url)
    http_response = Net::HTTP.post_form(
      uri,
      response: @response,
      secret: Secrets.recaptcha_secret
    )
    http_response.body.success
  end

  private def verification_url
    'https://www.google.com/recaptcha/api/siteverify'.freeze
  end
end

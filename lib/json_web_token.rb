# JsonWebToken decodes and verifies the incoming access token taken from
# the Authorization header of the request.
# JsonWebToken retrieves the public key for your Auth0 tenant
# and then uses it to verify the signature of the access token.

require "net/http"
require "uri"

class JsonWebToken
  def self.verify(token)
    JWT.decode(
      token,
      nil,
      true, # Verify the signature of this token
      algorithm: "RS256",
      iss: ENV["AUTH0_DOMAIN"],
      verify_iss: true,
      aud: ENV["AUTH0_IDENTIFIER"],
      verify_aud: true,
    ) { |header| jwks_hash[header["kid"]] }
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{ENV["AUTH0_DOMAIN"]}/.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)["keys"])
    Hash[
      jwks_keys.map do |k|
        [
          k["kid"],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k["x5c"].first),
          ).public_key,
        ]
      end
    ]
  end
end

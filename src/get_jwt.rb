require 'openssl'
require 'jwt'

# Private key contents
private_pem = File.read("YOUR_PATH_TO_PEM")
private_key = OpenSSL::PKey::RSA.new(private_pem)

# Generate the JWT
payload = {
  # issued at time, 60 seconds in the past to allow for clock drift
  iat: Time.now.to_i - 60,
  # JWT expiration time (10 minute maximum)
  exp: Time.now.to_i + (10 * 60),
  
# GitHub App's client ID
  iss: "YOUR_CLIENT_ID"
}

jwt = JWT.encode(payload, private_key, "RS256")
puts jwt
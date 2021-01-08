class JsonWebToken
  def self.encode(payload)
    expiration = 2.weeks.from_now.to_i
    JWT.encode payload.merge(exp: expiration), "16fc021a1a7a883b6523432fb6aace7507f1b09595d3eaa2bf1c771be86dc8dbf84552e38cff2bc59f82813e0a8a3fa5ccc660dd380136244d5f0e3c4bf2b5b2"
  end
  def self.decode(token)
    JWT.decode(token, "16fc021a1a7a883b6523432fb6aace7507f1b09595d3eaa2bf1c771be86dc8dbf84552e38cff2bc59f82813e0a8a3fa5ccc660dd380136244d5f0e3c4bf2b5b2").first
  end
end

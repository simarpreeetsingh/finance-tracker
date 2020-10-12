class Stock < ApplicationRecord

  def self.new_lookup (ticker)

    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:publishable_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    return client.price(ticker)

  end

end
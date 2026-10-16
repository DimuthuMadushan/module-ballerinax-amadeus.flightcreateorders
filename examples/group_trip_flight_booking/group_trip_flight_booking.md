# Group trip flight booking

This example books a one-way flight order for a group of travelers. It turns the configured passenger list into travelers, adds a group contact, creates the order and prints each traveler that Amadeus recorded on it.

## Prerequisites

### 1. Get Amadeus API credentials

Create an application in the [Amadeus for Developers portal](https://developers.amadeus.com/) and note its API key and API secret. They are used as the client ID and client secret of the OAuth 2.0 client credentials grant.

### 2. Configuration

Create a `Config.toml` file in this example's directory with the following content:

```toml
clientId = "<api-key>"
clientSecret = "<api-secret>"
tokenUrl = "<token-endpoint, e.g. https://api.amadeus.com/v1/security/oauth2/token, or https://test.api.amadeus.com/v1/security/oauth2/token for a test app>"
serviceUrl = "<booking-endpoint, e.g. https://api.amadeus.com/v1/booking, or https://test.api.amadeus.com/v1/booking for a test app>"
flightOfferId = "<flight-offer-id>"
originCode = "<origin-iata-code>"
destinationCode = "<destination-iata-code>"
carrierCode = "<carrier-code>"
flightNumber = "<flight-number>"
departureTime = "<departure-local-time, e.g. 2026-03-01T21:05:00>"
arrivalTime = "<arrival-local-time>"
groupContactEmail = "<contact-email-address>"

passengers = [
    {firstName = "<first-name>", lastName = "<last-name>", dateOfBirth = "<date-of-birth, e.g. 1982-01-16>"},
    {firstName = "<first-name>", lastName = "<last-name>", dateOfBirth = "<date-of-birth>"}
]
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

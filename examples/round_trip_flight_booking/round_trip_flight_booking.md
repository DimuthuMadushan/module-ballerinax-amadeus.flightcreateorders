# Round trip flight booking

This example books a round-trip flight order for one traveler. It builds the outbound and return itineraries from a previously priced flight offer, attaches the traveler's identity and contact details, creates the order and prints the booking references returned by Amadeus.

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
outboundCarrier = "<outbound-carrier-code>"
outboundFlightNumber = "<outbound-flight-number>"
outboundDeparture = "<outbound-departure-local-time, e.g. 2026-03-01T21:05:00>"
outboundArrival = "<outbound-arrival-local-time>"
returnCarrier = "<return-carrier-code>"
returnFlightNumber = "<return-flight-number>"
returnDeparture = "<return-departure-local-time>"
returnArrival = "<return-arrival-local-time>"
travelerFirstName = "<first-name>"
travelerLastName = "<last-name>"
travelerDateOfBirth = "<date-of-birth, e.g. 1982-01-16>"
travelerEmail = "<email-address>"
travelerPhone = "<phone-number>"
travelerCountryCallingCode = "<country-calling-code, e.g. 33>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```

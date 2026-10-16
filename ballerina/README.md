## Overview

[Amadeus for Developers](https://developers.amadeus.com/) offers self-service travel APIs for searching, pricing and booking flights, hotels and related travel services. The Flight Create Orders API creates a flight order, which books the priced flight offers for the travelers, contacts and payment details supplied in the request.

The Amadeus Flight Create Orders connector lets Ballerina applications book flights through the Amadeus booking engine. It supports version 1.10.0 of the Flight Create Orders API.

### Key features

- Create flight orders from priced flight offers
- Attach traveler identity, contact and loyalty details to a booking
- Provide forms of payment, ticketing agreements and remarks with the order
- Authenticate with the OAuth 2.0 client credentials grant

## Setup guide

To use the Amadeus Flight Create Orders connector, you need an Amadeus for Developers account and an application with an API key and API secret.

1. Sign up or log in at the [Amadeus for Developers portal](https://developers.amadeus.com/register).

2. Open **My Self-Service Workspace** and click **Create new app**.

3. Give the app a name and click **Create**. The app is created for the test environment. The connector targets production by default, so request **Move to Production** from the app's page before booking real orders.

4. Copy the **API Key** and **API Secret** from the app's details. They are the client ID and client secret used to obtain access tokens from `https://api.amadeus.com/v1/security/oauth2/token` (`https://test.api.amadeus.com/v1/security/oauth2/token` for a test app).

## Quickstart

To use the Amadeus Flight Create Orders connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `amadeus.flightcreateorders` module.

```ballerina
import ballerinax/amadeus.flightcreateorders as amadeus;
```

### Step 2: Instantiate a new connector

1. Create a `Config.toml` file and configure the credentials obtained in the steps above:

```toml
clientId = "<API Key>"
clientSecret = "<API Secret>"
```

2. Create an `amadeus:ConnectionConfig` with the OAuth 2.0 client credentials and initialize the connector with it.

```ballerina
configurable string clientId = ?;
configurable string clientSecret = ?;

final amadeus:Client amadeusClient = check new ({
    auth: {
        tokenUrl: "https://api.amadeus.com/v1/security/oauth2/token",
        clientId,
        clientSecret
    }
});
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Create a flight order

```ballerina
public function main() returns error? {
    amadeus:Success_Booking _ = check amadeusClient->createFlightOrder({
        data: {
            'type: "flight-order",
            flightOffers: [
                {
                    'type: "flight-offer",
                    id: "1",
                    'source: "GDS"
                }
            ]
        }
    });
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The Amadeus Flight Create Orders connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-amadeus.flightcreateorders/tree/main/examples/), covering the following use cases:

1. [Round trip flight booking](https://github.com/ballerina-platform/module-ballerinax-amadeus.flightcreateorders/tree/main/examples/round_trip_flight_booking) - Book a round-trip flight order for one traveler with outbound and return itineraries and read back the booking references.

2. [Group trip flight booking](https://github.com/ballerina-platform/module-ballerinax-amadeus.flightcreateorders/tree/main/examples/group_trip_flight_booking) - Book a one-way flight order for a group of travelers with a shared contact and list the travelers recorded on the order.

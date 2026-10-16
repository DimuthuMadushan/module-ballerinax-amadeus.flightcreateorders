// Books a round-trip flight order for a single traveler from a flight offer that was priced beforehand.

import ballerina/io;
import ballerinax/amadeus.flightcreateorders as amadeus;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string tokenUrl = ?;
configurable string serviceUrl = ?;
configurable string flightOfferId = ?;
configurable string originCode = ?;
configurable string destinationCode = ?;
configurable string outboundCarrier = ?;
configurable string outboundFlightNumber = ?;
configurable string outboundDeparture = ?;
configurable string outboundArrival = ?;
configurable string returnCarrier = ?;
configurable string returnFlightNumber = ?;
configurable string returnDeparture = ?;
configurable string returnArrival = ?;
configurable string travelerFirstName = ?;
configurable string travelerLastName = ?;
configurable string travelerDateOfBirth = ?;
configurable string travelerEmail = ?;
configurable string travelerPhone = ?;
configurable string travelerCountryCallingCode = ?;

public function main() returns error? {
    amadeus:Client amadeusClient = check new ({
        auth: {tokenUrl, clientId, clientSecret}
    }, serviceUrl);

    amadeus:FlightOrderQuery payload = {
        data: {
            'type: "flight-order",
            flightOffers: [
                {
                    'type: "flight-offer",
                    id: flightOfferId,
                    'source: "GDS",
                    itineraries: [
                        {
                            segments: [
                                {
                                    departure: {iataCode: originCode, at: outboundDeparture},
                                    arrival: {iataCode: destinationCode, at: outboundArrival},
                                    carrierCode: outboundCarrier,
                                    number: outboundFlightNumber
                                }
                            ]
                        },
                        {
                            segments: [
                                {
                                    departure: {iataCode: destinationCode, at: returnDeparture},
                                    arrival: {iataCode: originCode, at: returnArrival},
                                    carrierCode: returnCarrier,
                                    number: returnFlightNumber
                                }
                            ]
                        }
                    ]
                }
            ],
            travelers: [
                {
                    id: "1",
                    dateOfBirth: travelerDateOfBirth,
                    name: {firstName: travelerFirstName, lastName: travelerLastName},
                    contact: {
                        emailAddress: travelerEmail,
                        phones: [
                            {deviceType: "MOBILE", countryCallingCode: travelerCountryCallingCode, number: travelerPhone}
                        ]
                    }
                }
            ]
        }
    };

    amadeus:Success_Booking booking = check amadeusClient->createFlightOrder(payload);
    io:println("Flight order created with id: ", booking.data.id ?: "unassigned");
    amadeus:AssociatedRecord[]? records = booking.data.associatedRecords;
    if records is () || records.length() == 0 {
        return error("The order was created but no booking reference was returned");
    }
    foreach amadeus:AssociatedRecord associatedRecord in records {
        io:println("Booking reference: ", associatedRecord.reference);
    }
}

#Meet Geek 

Meet Geek is an app to solve the problem of when you want to go to a live event but none of your friends want to go with you. Meet Geek connects people who are going to the same live event.

Meet Geek uses the Seat Geek API to get a list of live events and displays them on a Table View. Click on an event to go to a Sign Up page and put your name on the attendees list.

**ViewController** - Displays live events in a table view

**EventTableViewCell** - Custom cell made to display the event information in the ViewController table view

**SeatGeekNetworking** - Makes calls to the Seat Geek API to get up-to-date live event information

###Objects

**Event** - The data from the Seat Geek API is turned into Event objects. Each Event object is displayed in a table view cell in the ViewController table view.

**Attendee** - The attendee object is created when a person signs up to go to an event. This object holds the attendee's information such as name, age, sex, and comment, as well as an Event in order to use the Event name and Event id.



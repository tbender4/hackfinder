# hackfinder

**hackfinder** is a Hackathon search app using the [Eventbrite API](https://www.eventbrite.com/developer/v3/).

<img align="right" src='https://github.com/tbender4/hackfinder/raw/master/demo11-06.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
Hackfinder is an iOS App that will help users find nearby hackathons using Location Services, or by searching for a specific location.

This was the final group project from taking **Codepath's iOS Development** course during Fall 2018. Core functionality was completed to meet the presentation day's deadline. This fork is my effort to give it critical improvements in functionality.

My contribution for the project was all of backend; interfacing the Eventbrite API to pull all information and parse into `Swift dictionaries`, implementing networking with `URLSession`  and images with `AlamofireImage`, and other minor `Cocapods`.

 
## User Stories

The following **required** user stories are complete:
- [x] Implement Eventbrite API parsing
- [x] app icon in home screen, styled launch screen
- [ ] **Fliter View** Implement [SideMenu](https://github.com/jonkykong/SideMenu)
- [x] **List View** user can change location of nearby hackathons to list
- [x] **List View** user can scroll through list of hackathons
- [x] **Map View** display map using location of user
- [x] **Map View** have pins for nearby hackathons by default
- [x] **Map View** user can click on pin to bring up detail view of event
- [x] **Detail View** show all information provided by eventbrite api
- [x] **Detail View** user is redirected to eventbrite website/app to RSVP

The following **optional** user stories are implemented:

- [ ] creating an API for MLH
- [ ] creating an API for hackathon.com
- [ ] calendar view
- [ ] networking error
- [ ] caching of events for offline
- [ ] direction integration or redirection to eventbrite's website
- [ ] user notified when new hackathons are in their area
- [ ] **User View** user can save upcoming hackathons in a separate list
- [ ] **User View** user will be periodically notified when saved hackathon is coming up
- [ ] **User View** user can save default locations

## Screenshots

<img align="center" src='https://github.com/tbender4/hackfinder/raw/master/screenshots/map.png' title='map' width='377' height='669'  alt='map' /> <img align="center" src='https://github.com/tbender4/hackfinder/raw/master/screenshots/halfview.png' title='halfview' width='376' height='669'  alt='map' />

<img align="center" src='https://github.com/tbender4/hackfinder/raw/master/screenshots/listview.png' title='listview' width='375' height='667'  alt='map' /> <img align="center" src='https://github.com/tbender4/hackfinder/raw/master/screenshots/detail.png' title='detail' width='376' height='667'  alt='map' />

## Wireframe

<img src='https://github.com/tbender4/hackfinder/blob/master/wireframe.png'>

## API Endpoints

The [Eventbrite API](https://cloud.google.com/maps-platform/) is used for finding Hackathons events.

The [Google Maps API](https://cloud.google.com/maps-platform/) is used for the map view integration.

## Usage
  
- Core flows
  - Key functions would be the Map View that can use Location Services to interactively show nearby hackathons. List View with the Filter View can work together to narrow the user's options. The Details View is to show the user more information of the hackthon they've selected to see if the event is right for them.  
  - Each user will be able to see the Default View which is the Map View with dates written on Pins by the location of every event. Gestures are used to navigate around the map or just change to List View if the user prefers.
  
- Final Demo
  - As the Map View is the default mode of the app there will be tab bar on the bottom to switch screens to List View or to Map View. From either view, the user can tap on an event to segueway it to Detail View and give more details on the event. There will be a Filter View will also be presented to demonstrate narrowing down options.
 
- Mobile features
  - Geo-location, Map features, enabling current location, and have current activity feed for hackathon events.
  
- Technical concerns
  - To have accurate location services
  - To have precise content of our activity feed
  

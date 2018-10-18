# hackfinder
# Group Project - *hackerfinder*


**hackfinder** is a Hackathon search app using the [Eventbrite API](https://www.eventbrite.com/developer/v3/).

Time spent: **X** hours spent in total

Description: 
Hackfinder is an iOS App that will help users find nearby hackathons using Location Services, or by searching for a specific location.

## User Stories

The following **required** user stories are complete:
- [ ] app icon in home screen, styled launch screen
- [ ] **List View** user can change location of nearby hackathons to list
- [ ] **List View** user can scroll through list of hackathons
- [ ] **Map View** display map using location of user
- [ ] **Map View** have pins for nearby hackathons by default
- [ ] **Map View** user can click on pin to bring up detail view of event
- [ ] **Detail View** show all information provided by eventbrite api
- [ ] **Detail View** user is redirected to eventbrite website/app to RSVP

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

## Wireframe

<img src='https://raw.githubusercontent.com/hackfinder00/hackfinder/master/wireframe.png'>

## API Endpoints

The [Eventbrite API](https://cloud.google.com/maps-platform/) is used for finding Hackathons events.

The [Eventbrite API](https://cloud.google.com/maps-platform/) is used for the map view integration.

## Model Classes
- Event
  - `title`
  - `overview`
  - `backdrop`
  - `avatar`
- EventApiManager
  - `apikey`
  - `url`
  - `session`

- Map
  - `MapPins`

- EventCell
  - `title`
  - `overview`
  - `avatar`
  - `date`
  - `rsvp`
  - 

- MapViewController
  - `map`
  - `search`

- ListViewController
  - `search`
  - `filter`
  - `cell`

- DetailViewController
  - `title`
  - `overview`
  - `date`
  - `rsvp`
  - `backdrop`
  - `avatar`

- FilterViewController
  - `sortBy`
  - `location`
  - `date`
  - `isFree`
  
##Considerations
- Product Pitch
  - There is not an app, with a focus on finding hackathon events. 
  - The aim is towards computer science students, that want to attend hackathons that fits best with their schedule, the preferred distance, and preference details into gaining in the event.
  
- Key stakeholders
  - Educational facilities such as Colleges, Universites. Tech companies can recruit students from hackathons events.
  - The app with ease the opportunity to gain experience of programming under pressure, and to expanding their network with students and Tech companies. 
  
- Core flows
  - Key functions would be the Map View where it use your current location and aid you to pinpoint nearby hackathons. List View with the function of Filter View working together to narrow users options. The Details View for the user to assist their decision if the event benefits them.  
  - Each user will be able to see the Default View which is the Map View with dates written on the location of the event and can use gestures to navigate around the map or just change it to List if user prefers.
  
- Final Demo
  - As the Map View is the default mode of the app there will be tab bar on the bottom to switch screens to List View or to Map View. From List View, you can click on an event which becomes Details View and will give you more details on the event. There will be a Filter View to narrow down options.
 
- Mobile features
  - Geo-location, Map features, enabling current location and have current activity feed for hackathon events.
  
- Technical concerns
  - To have accurate location services
  - To have precise content of our activity feed
  

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

Copyright [2018] [Team: Thomas Bender, Jamil Jalal, Claudia Martinez]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

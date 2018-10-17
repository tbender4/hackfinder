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

The Eventbrite API is used for finding Hackathons events.

The Google Maps API is used for the map view to all events.

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

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

Copyright [2018] [Team: Thomas, Jamil, Claudia]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

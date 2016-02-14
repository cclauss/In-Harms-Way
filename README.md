# In-Harms-Way
In Harm's Way is an ad hoc network for tracking users doing mountain sports

# At Altitude is a project for IBM's [Open Development for Disaster Response](http://ibm.co/1NJTF3w) hackathon

## Please consider joining our team...

TL;DR: __At Altitude__ is an opt-in service that tracks the location and status of users in dangerous environments.  The goal of the system is to detect when trouble occurs and enable friends and rescue workers to provide local and remote assistance to those in need.

For current project status see [changelog.md](changelog.md)

Characteristics of the system:

* __Opt-in__: Users set up their own accounts and have full control of when the system is tracking them and when it is not.  Detailed tracking data will be only accessible by that user and "friends" unless an emergency situation occurs.

* __Tracks location and status__: Users will carry a smart device that will run an At Altitude mobile client which will send encrypted payloads containing time, location, altitude, battery level, temperature, etc. to At Altitude servers on a configurable periodic basis.  A secure tracking history for each user will be created and will be accessible to that user and his/her "friends".

* __Dangerous environments__: At Altitude was originally conceived for those engaged in mountain sports such as climbing and ski touring (aka back country skiing) but should be designed to be flexible enough to be useful for other sports (trekking, biking, marathons, sailing, hang gliding, etc.) as well as dangerous occupational environments (open pit mines, oil refineries, etc.) and for those involved in natural disasters (avalanches, snow storms, earthquakes, floods, forest fires, etc.).

* __Detect when trouble occurs__: To enable the user to manually alert the system of a situation, the mobile app will have a large, easy to find panic button with a large, easy to tap confirmation button.  The app will then propose to place a direct call to local authorities (e.g. park ranger, air rescue, 911 / 112,  etc.).  The user's attention might be better focused on the situation at hand so the At Altitude system should create and manage a critical situation (critsit) even if no call is placed.

    Automatic detection of trouble situations could be enabled via sensors in the phone (or Bluetooth connected to the phone). These sensors could detect trouble situations such as rapid loss of altitude, sudden shock, significant and rapid change in temperature, etc. The thresholds for these triggers will be a real challenge because for instance in some activities such as skydiving a sudden loss of altitude should not be considered a panic situation where as in trekking, it should be. The At Altitude mobile application should also warn the user of problems (forest fire, flood, mine collapse, etc.) reported (by other users, sensors, systems) in their area (a system calculated geofence) and request whether they are in harm's way or if they would be in a position to act as a first responder to others in harm's way.

* __Friends__: At Altitude is a social network but is quite different from Facebook, Twitter, LinkedIn, Google+ etc.  The system should allow new users to create their profile by entering an email address and a password of by creating OAuth2 links to one or more existing social network account.  The user should then be led through the process of adding friends to their account.  The user will ba able to allow some friends to be notified when a critsit is raised against his profile.  The user may chose to share routes and and achievements with friends by sharing detailed location and status data.

* __Rescue workers__: At Altitude must fit in with other Emergency dispatch and Medical systems.  It must know which of its users have first aid and deeper medical experience.  It must know which emergency services to call based on location (e.g. near roads, call 911 but at altitude, call air rescue).  As new information about a critsit (new images, reports from the site, significant changes in sensor reading, etc.) comes into the At Altitude system, it should forwarded on to emergency dispatchers and/or first responders and hospitals.

* __Local and remote assistance__: Great care must be taken in system design and execution to ensure that remote users (probably friends) do not reduce the effectiveness of local users.  Warning friends of that a user is in critsit is useful but the system must focus their attention on providing actual relief rather than just spreading panic.

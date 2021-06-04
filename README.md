Original App Design Project - README Template
===

# PlantApp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
A reminder app where you can log your plants and be reminded of when they need to be watered. You can also puruse plant facts and find places that these plants are sold.
Final Video Demo: https://youtu.be/4aQuWW_iMcI

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Lifestyle
- **Mobile:** This app would primarily be a mobile app as its main purposes are to remind and most people have their phones costantly as opposed to their laptop. 
- **Story:** Analyzes plant needs and sets reminders, and people can explore different plants sold near them.
- **Market:** Any individual could choose to use this app. Especially in quarantine, many people have bought plants and they have become increasingly popular on social media as well.
- **Habit:** This app could be used as often as the user wants, depending on how much time they would like to spend taking care of their plants. 
- **Scope:** First, we would start with features surrounding taking care of the user's plants, but it would also be interesting to expand scope and suggest that the user can learn about and purchase other plants on our explore page.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] User logs in to access their previously logged plant information
- [X] User can log the plants that they have (names and number of each type of plant)
- [ ] User gets reminder when it is time to water their logged in plants
- [X] User can access Discover page to see inspiration for plants to get
- [X] Settings/Profile Page



**Optional Nice-to-have Stories**

* Explore page with reccomended plants for user to potentially buy (could be based on location, plants they currently have, etc.)
* Reccomendations for places to buy plants nearby
* Animations for when the plant is fully watered vs when it needs water etc

### 2. Screen Archetypes

* Login
* Register - User signs up or logs into their account
    * This is required as each user logs in their plants and the app is personalized per user to these plant's needs
* Profile
    * A screen where the user can see their plant gallery 
* Settings
    * A screen where the user can set their notification preferences 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile (plant gallery)
* Explore page
* Notification settings

**Flow Navigation** (Screen to Screen)

* Login --> Account creation if no login available
* Login to profile
* Add a plant
* Logout
* Profile (plant gallery) --> Notification settings
* Profile (plant gallery?) --> Plant explore page

## Wireframes
[Add picture of your hand sketched wireframes in this section]
![](https://i.imgur.com/FqWgrYT.png)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models
| Property | Type | Description |
| --- | --- | --- |
| userName | String | user's profile name |
| userPicture | File | user's profile picture |
| plantName | String | each plant in the user's gallery name |
| comments | String | comments on the forum |
| wateringPeriod | Number | how long until next watering is needed per plant|
| plantImage | File | image of the plant |
| likeCount | Number | number of likes on a post|

### Networking
- Forum Screen
  - (Create/POST) Create a new like on a post
  - (Delete) Delete existing like
  - (Create/POST) Create a new comment on a post
  - (Delete) Delete existing comment
- Create Post Screen
  - (Create/POST) Create a new post object
- Profile Screen
  - (Read/GET) Query logged in user object
  - (Update/PUT) Update user name
  - (Update/PUT) Update user profile image
  - (Create/POST) Add a plant image/info
- Gallery Sreen
  - (Read/GET) Images from Plant API for browsing
- Notifications
  - (Create/POST) Notification creation 
  - (Delete) Delete notification
- [OPTIONAL: List endpoints if using existing API such as Yelp]

### Sprint1 

Gif of Login/Written Post Page

<img src=Sprint1Gif1.gif width=250><br>

Gif of Login/Image Post Page

<img src=Sprint1Gif2.gif width=250><br>


Image attribution: Darius Dan, flaticon (https://www.flaticon.com/packs/plants-28)

### Sprint2

Gif of Profile/Settings

<img src=Gif1Sprint2.gif width=250><br>

Gif of Plant Gallery Draft

<img src=https://media.giphy.com/media/JP5DNER5whQv7F6s4E/giphy.gif><br>

### Sprint3

Gif of Launch Page

<img src=https://media.giphy.com/media/JfoDYNcmYkyXtB7pKa/giphy.gif><br>

Gif of Discover Page

<img src=https://media.giphy.com/media/2w3NiKaE1wwBuOt7h4/giphy.gif><br>

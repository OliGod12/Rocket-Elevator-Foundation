# ROCKET ELEVATORS INFORMATION SYSTEM

## UPDATE Week 7
We were asked to add 7 API : Slack, GoogleMaps, Zendesk, SendGrid, IBM Watson, DropBox and Twilio. The following instructions are required to test out the features of each API.

## Our Team
  - Olivier Godbout - Team Leader
  - Samuel Chabot  - Collaborator 
  - Colin Larke - Collaborator 
  - James Allan Jean-Jacques - Collaborator

## Back Office Admin Logins
  - admin@example.com , password
  - test@test , 123123

- Nicolas Genest | Comm Rep | nicolas.genest@codeboxx.biz | password: 123456
- Nadya Fortier | Director | nadya.fortier@codeboxx.biz | password: 123456
- Martin Chantal | Director Assistant | martin.chantal@codeboxx.biz | password: 123456
- Mathieu Houde | Captain | mathieu.houde@codeboxx.biz | password: 123456
- David Boutin | Engineer |david.boutin@codeboxx.biz | password: 123456
- Mathieu Lortie | Engineer | mathieu.lortie@codeboxx.biz | password: 123456
- Thomas Carrier | Engineer| thomas.carrier@codeboxx.biz | password: 123456

## Back Office Customer Logins
 - email: 'test1@gmail.com' password: '123456'
 - email: 'test2@gmail.com', password: '123456'

## API Implemented
- GoogleMaps - Samuel Chabot/ James Allan Jean-Jacques
- Twilio - Colin Larke
- Slack - Olivier Godbout 
- Dropbox - Samuel Chabot
- SendGrid - Samuel Chabot
- IBM Watson - Colin Larke
- Zendesk - Samuel Chabot


 ## INSTRUCTIONS TO FOLLOW

 ## Google Maps
This Api is used to allow administrators of the Back-office to geolocate on a map every client’s buildings across North America.

To take a look at the map you need to go to the Admin section and the map appears in the Dashboard's table.

Every pointer marks the localization of every buildings and hovering the following informations: address, number of floors, clients name, number of batteries, number of columns, number of elevators and the technician’s full name.

Everytime you change the address or create a new one, if you have enough information (ex: number and street, city) every other informations get updated.


 ## Twilio
The API triggers only once the status of an elevator is changed to "Intervention", then the client will get a text message on his phone.

Go to rocketelevatorss.com. Login into your account, go to the employee's page and then click on the elevator's table. From there, you can select which elevator you want to change its status. Change its status from "Active/Inactive" to "Intervention", scroll down and click save, then you'll receive a message on your phone.


 ## Slack
The API triggers whenever the status of an elevator is changed, then the client will get a a message on his Slack channel : "elevator-operations".

Go to rocketelevatorss.com. Login into your account, go to the employee's page and then click on the elevator's table. From there, you can select which elevator you want to change its status. Once the elevator is selected, change its status, scroll down and click save, then you'll receive a message on the Slack "elevator-operations" channel


 ## Dropbox
The API triggers if the "Contact Us" form has a file while a customer is connected.

Reach the contact form on the home page of : https://rockettothesky.com/. Fill the contact form and add a file in the "File Attachment" section as a customer (email:test1@gmail.com, password:123456) and then send your form. After that, log out, and log in as an admin (see the backoffices admin users in the top of the Readme). Click on the leads table and then you can copy the file url and paste it into your browser to see the file.

First step: Click on the link that we sent you, in your email inbox and make account. Second step: Once you signed in, it will prompt you to accept the invitation to the shared folder. Third step: Then you will see the rocket_elevator_client folder where the folder of each client will be stored. Ps: We sent you this link for correction purposes, you can also access the files through the url which is stored in the database.


 ## SendGrid
This api triggers if a contact completes the "Contact Us" form on the homepage of https://rockettothesky.com/. A transactional thank-you email will be sent to the email address putted in the form.

Reach the contact form on the index of : https://rockettothesky.com/. Fill the contact form using your email address, and once the form is sent, you'll receive an automatic reply to your email's.


 ## IBM Watson
With IBM Watson Text to speech API you are able to listen a written summary about the current state of the company. If the database is changed the summary is updating itself.

IBM Watson is taking its numbers of leads and quotes from Zendesk API.

To access this feature, sign in to the admin panel : https://rockettothesky.com/admin. Once you got into the dashboard you can click play on the audio button to hear about the company's summary.


 ## Zendesk
This api triggers every time a Quote or a Lead is generated. It will create a ticket with all the information needed to get back to our customer on our Zendesk account for each lead and quote we receive.
We already gave you access to our Zendesk dashboard, just look in your emails. The link: https://imastuden.zendesk.com/agent.

## ******************** BONUSES ********************
## Open weather API
Every time someone clicks on a marker on the map, it will hover the weather of the specific places.

## Star Wars API
Add text-to-speech functionality to the Home Dashboard. The option start the every time the Admin Dashboard page appears. There are 420 possibilities of random facts from Star Wars.

## Captcha API
We added reCAPTCHA API to protect our site from spam and abuse. The send button is disabled until you verify that you are a human.

## Nudity Recognition API
In order to avoid trauma to our employees, we added an API that would filter the files sent via the "Contact us" form. If the file has explicit content, no leads will be sent into the database and a legal action email will be sent to the person. 

## Link to get the collection of query for Postman
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/3f98d5e6a531e3025b47)

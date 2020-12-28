# BetWorksLogin

## Attention
The Mock server expects "DurodolaHabib043" as username else it will fail. Password can be anything as long as it conforms to the Regex
(13 CHARACTERS - ONE CAPITAL AND ONE DIGIT)

## App Architecture
This app uses the MVVM architecture
1. The View - consist of the HomeViewController and LoginViewController 
2. ModelView - consist of the LoginModelView
3. Model - consist of Login Struct

## Acceptance Criteria
1. The Username and password is validated using Regex. It has to be 13 letters long containing a capital letter and a digit 
2. MockApiCleint returns expected responds 
3. Username is saved in a Singleton Model "MockApiClient"
4. Invisible Navigation is in effect.   (ALL A.C WAS SATISFIED)

## App Details
1. This is built programmatically NO STORYBOARD 


Also there are Extension and ApiClient class. 
The MVVM is used mainly to de-couple classes for unit-test.


## Build tool and Version
  1. Xcode Version 12.3 , Swift 5 
  2. This app was tested with iphone x , version 12.1 (16B92)
 


## Unit Test
The app has a unit test for the model class and UI test
PLEASE NOTE - To test UI in xcode simulator, you have to disable Keyboard

Steps to do that  
1. Click on the Simulatior I/O.
2. Click on Keyboard and uncheck "Connect Hardware Keyboard"

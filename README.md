# MotorwayTest
Brief
We would like to see a simple one-screen application that performs the following:
● Provides the ability to fill an editable text field with randomly generated text. It does
not have to make any grammatical sense.
● Displays a word count of the text in the text field.
● Allows the user to edit the text field appending or deleting the copy as they see fit.

## UIFramework
SwiftUI

## Design Pattern
MVVM

## Testing
Mocks remain in the code base rather then inside the test target. I have done this to support Live Previews. In a real world enviroment i personally think its best to avoid Async tasks for live previews and keep them as simple as possible.

However the downside to this is Code coverage. It currently sits at 78% - this is solely due to the mock objects not being tested.
## Code Coverage
78.8%

## Notes
The brief mentions randomly generate "TEXT" and not "Words" therfore the text generated are not real words. This would have been questioned before proceeding if it wasnt a test and for the sake of time/effort i opted for the literal meaning.

Also as the spec states "word" count rather then character count - the count value observes text groups seperated by white space. Again this would be questioned as its normal practice to count characters rather than "words".

## Devices
All Devices and rotations are supported however ive only tested and built this on iPhone in potrait

## Other considerations
No work has been carried out on localization and Accessibility

## Screens (Dark and Light)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-25 at 20 36 52](https://user-images.githubusercontent.com/1189000/214684733-382aa1f9-c857-4ffd-90ac-40af99232c64.png)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-25 at 20 36 47](https://user-images.githubusercontent.com/1189000/214684744-b51d0ba6-3273-40f3-8ce0-e1bcd19d9f34.png)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-25 at 20 36 38](https://user-images.githubusercontent.com/1189000/214684749-9d0c4f5c-91f8-44e4-b0c7-8faee14939a8.png)
![Simulator Screen Shot - iPhone 14 Pro - 2023-01-25 at 20 36 27](https://user-images.githubusercontent.com/1189000/214684751-0b935436-60ca-493c-942c-89b82261b4b4.png)

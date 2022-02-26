<!-- ABOUT THE PROJECT -->
## StepTracker

This is my attempt at a StepTracker iOS app. Using the CMPedometer class from the CoreMotion Library, I am able to gather step data as well as other metrics from the last 7 days. In this project, I allow this to be used on simulator as well by way of mock data (It is annotated in the code) and real data from the user's device.

On the StepTrackerHomeVC, you can see a tableview of the last 7 days of step data. Clicking on it will present a Modal VC of a detailed breakdown of that day's activity (Distance, Floors Ascended, Floors Descended and Average Active Pace). Forgive my lack of visual aesthetic, I am not the best UX design and usually work better off of design mock ups :D (I scrapped those icons together myself!). I also had plans to have a more indepth analysis message besides "Great work! Keep it up for tomorrow." one that would compare the previous days data but for the sake of time and complexity (Since we were working with mock data, I would've had to handle specific cases for when running on simulator) I held off.

### Built With

* [Swift](https://www.swift.org/)

## Build

Open the project and you should be able to click run or CMD-R to build and run the project on either a simulator (Via Mock Data) or on your device (iOS 13 and above supported). You will likely have to accept my development signatue to test on a device. (Settings)

## Running unit tests

Navigate to StepTrackerTests.swift. From there you can run individual tests or the entire test suite. According to the coverage report, we are at 93.9% code coverage (The remaining 6.1% involves AppDelegate and SceneDelegate as well as the required init in the tableview cell). I've found that at times, the tests have a hard time running the async code so to mitigate this I recommend commenting out the group.enter() and group.leave() calls if that closure block is not being run for a particular simulator. (It should work fine with device unit tests, I did run into a few IDE issues with XCode getting Unit Tests to run at times but that seems to be more an XCode issue). I have included that last coverage report as well in the source code folder.

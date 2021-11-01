# PrivacyApp
The greatest challenge of this app was figuring out the best way to add all 9 buttons numbers 0-9. NSLayoutConstraints are configured programatically using a for loop and a little bit of math so that I did not have to hard code constraints for all 9 numbers. 
This UI is inspired from Apple's passcode UI to unlock your iphone. Users have a certain number of attempts to log into the app before they are locked out using a UIAlertController. The default password is 1234 and a UINavigationController will transition a user to be able to add content. The lock and unlock are system icons provided by apple but their sizes are changed to create a better UI.
Users can add photos or videos from their library using a UIImagePickerController. They may also take photos or videos if their device supports it. Their content is  displayed using a UICollectionView and UICollectionViewDelegateFlowLayout. The UICollectionViewCells are a UIImageView. 

![Simulator Screen Shot - iPhone 12 Pro Max - 2021-10-31 at 23 11 32](https://user-images.githubusercontent.com/60244532/139629260-30ba037b-eada-4dc0-833f-5406740aa16f.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2021-10-31 at 23 11 19](https://user-images.githubusercontent.com/60244532/139629268-a2568eaf-ba5a-487e-a114-cfb370e5d0c4.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2021-10-31 at 23 11 07](https://user-images.githubusercontent.com/60244532/139629271-338a5c87-41c6-4fba-a7cc-999c331b8d48.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2021-10-31 at 23 10 27](https://user-images.githubusercontent.com/60244532/139629276-007e7c55-92df-4d2b-a5d6-8f95ce95ceca.png)
![Simulator Screen Shot - iPhone 12 Pro Max - 2021-10-31 at 23 10 17](https://user-images.githubusercontent.com/60244532/139629277-b5199ef8-01b4-45d2-9837-a4bdb54c2309.png)

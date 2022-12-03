# Spotted

# A short description of our app

An inclusive multiplayer target game inspired by the live-action game Assassin--where players elimate one another to become the last surviving player--meant to unite the diverse Cornell community via "spotting" one another at different corners of our campus.

  Notable features:
  
  - implements a custom camera view controller (main view when entering app); capture button, front & rear camera functionality, button to    
    activate/deactivate flash
  - TabBarController to navigate between five main ViewControllers (instructions, feed, camera, leaderboard, & profile)
  - popups that display information about the user and their target

# Some screenshots of our app

Help Page

![instructions](https://user-images.githubusercontent.com/118781810/205428762-3fb5338a-bd13-4f96-86cf-a2162c8f65f8.jpeg)

Feed Page

![feed](https://user-images.githubusercontent.com/118781810/205428771-0f5dd82c-927e-4111-9eb4-c4e6f58a8bd5.jpeg)

Camera Page

![camera](https://user-images.githubusercontent.com/118781810/205428782-42cd9347-58d4-4e68-a607-9f5960feec74.jpeg)
![photoCaptured](https://user-images.githubusercontent.com/118781810/205428789-98a6ba1d-2828-453d-a0a2-d41aa1af47f1.jpeg)

Leaderboard Page

![leaderboard](https://user-images.githubusercontent.com/118781810/205428794-362088ea-1881-43e6-b171-b74351fb0307.jpeg)

Profile Page

![profile](https://user-images.githubusercontent.com/118781810/205428795-2f95c066-8f99-4666-8a1e-545cf9d27530.jpeg)
![profileTarget](https://user-images.githubusercontent.com/118781810/205428797-46ec1aa7-7392-4165-ac21-a36fa193e802.jpeg)
![profileCommunity](https://user-images.githubusercontent.com/118781810/205428801-61f79869-e9f4-4e98-9c05-faffabd6e0c8.jpeg)


# A list of how our app addresses each of the requirements
  
  1. SwiftUI or AutoLayout using NSLayoutConstraint or SnapKit (no storyboards) --> uses NSLayoutConstraint in instances of UIViewController
  2. At least one UICollectionView, UITableView, or List (SwiftUI) --> CollectionView implemented in FeedViewController
  3. Some form of navigation to navigate between screens—push, present etc. --> TabBarController (see above); multiple push/present views included as part 
     of leaderboard & profile views
  5. Integrate with your Backend’s API - this API must provide some meaningful value to your app. --> API used to store user data and display it in         
     GalleryCollectionView (FeedViewController); with the time allotted we had to focus mainly on post data, specifically titles, captions, & comments 

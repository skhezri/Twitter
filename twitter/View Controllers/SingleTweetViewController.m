//
//  SingleTweetViewController.m
//  twitter
//
//  Created by Sophia Khezri on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "SingleTweetViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "APIManager.h"

@interface SingleTweetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *rtCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

//Details view page for a specific tweet
@implementation SingleTweetViewController

//Connects to the favorite button
- (IBAction)didTapFavorite:(id)sender {
   //Increases the favorite count
    if(self.tweet.favorited==NO){
        self.tweet.favorited=YES;
        self.tweet.favoriteCount+=1;
        self.favButton.selected=YES;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    } else{
        //Decreases the favorite count
        self.tweet.favorited=NO;
        self.tweet.favoriteCount-=1;
        self.favButton.selected=NO;
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error un-favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully un-favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    [self refreshFavoriteData];
}
//Connects to the retweet button
- (IBAction)didTapRetweet:(UIButton *)sender {
    //Increases the retweet count
    if(self.tweet.retweeted==NO){
        self.tweet.retweeted=YES;
        self.tweet.retweetCount+=1;
        self.rtButton.selected=YES;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeting the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
    //Decreases the favorite count
        self.tweet.retweeted=NO;
        self.tweet.retweetCount-=1;
        self.rtButton.selected=NO;
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error un-retweeing tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully un-retweeted the following Tweet: %@", tweet.text);
            }
        }];
        
        
        
        
    }
    [self refreshRetweetData];
    
}

//Loads the SingleTweetViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetText.text=self.tweet.text;
    NSLog(@"%@", self.tweetText.text);
    self.userName.text=self.tweet.user.name;
    self.userHandle.text=self.tweet.user.screenName;
    [self.profilePic setImageWithURL:self.tweet.user.profilePic];
    NSString *favorites=[NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.favCountLabel.text=favorites;
    NSString *retweets=[NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.rtCountLabel.text=retweets;
    [self.userName sizeToFit];
    [self.userHandle sizeToFit];
    self.date.text=self.tweet.createdAtString2;
    self.time.text=self.tweet.createdAtString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Updates the favorite count label
-(void) refreshFavoriteData{
    NSString* favCountString=[NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.favCountLabel.text=favCountString;
}
//Updates the retweet count label 
-(void) refreshRetweetData{
    NSString* retweetCountString= [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.rtCountLabel.text=retweetCountString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

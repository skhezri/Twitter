//
//  TweetCell.m
//  
//
//  Created by Sophia Khezri on 7/3/18.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "DateTools.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//Method that connects to the favorite button once it is tapped (changes icon color and favorite count amount)
- (IBAction)didTapFavorite:(UIButton *)sender {
    //Increases favorite count
    if(self.tweet.favorited==NO){
        self.tweet.favorited=YES;
        self.tweet.favoriteCount+=1;
        self.favoriteButton.selected=YES;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    } else{
        //Decreases favorite count
        self.tweet.favorited=NO;
        self.tweet.favoriteCount-=1;
        self.favoriteButton.selected=NO;
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
//Method that connects to the retweet button once it is tapped (changes icon color and retweet count amount)
- (IBAction)didTapRetweet:(UIButton *)sender {
   //Increases retweet count amount
    if(self.tweet.retweeted==NO){
        self.tweet.retweeted=YES;
        self.tweet.retweetCount+=1;
        self.retweetButton.selected=YES;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeting the following Tweet: %@", tweet.text);
            }
        }];
    }
    //Decreases retweet count amount
    else{
        self.tweet.retweeted=NO;
        self.tweet.retweetCount-=1;
        self.retweetButton.selected=NO;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//Sets all of the tweet properties on each cell on the table view (specific to the user)
-(void) setTweet:(Tweet *)tweet{
    _tweet=tweet;
    self.tweetText.text=tweet.text;
    self.name.text=tweet.user.name;
    self.date.text=tweet.createdAtString;
    self.tweetText.text=tweet.text;
    self.screenName.text=tweet.user.screenName;
    self.retweetCountLabel.text= [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.favoriteCountLabel.text= [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    [self.profilePic setImageWithURL:tweet.user.profilePic];
}
//Updates favorite count label
-(void) refreshFavoriteData{
    NSString* favCountString=[NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    self.favoriteCountLabel.text=favCountString;
}
//Updates retweet count label 
-(void) refreshRetweetData{
    NSString* retweetCountString= [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.retweetCountLabel.text=retweetCountString;
}



@end

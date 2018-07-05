//
//  TweetCell.m
//  
//
//  Created by Sophia Khezri on 7/3/18.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setTweet:(Tweet *)tweet{
    _tweet=tweet;
    self.tweetText.text=tweet.text;
    self.name.text=tweet.user.name;
    self.date.text=tweet.createdAtString;
    self.tweetText.text=tweet.text;
    self.screenName.text=tweet.user.screenName;
    [self.profilePic setImageWithURL:tweet.user.profilePic];
}

@end

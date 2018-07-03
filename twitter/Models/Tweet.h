//
//  Tweet.h
//  twitter
//
//  Created by Sophia Khezri on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject


@property (nonatomic, strong) NSString *idStr;
@property (strong, nonatomic) NSString *text;
@property (nonatomic) int favoriteCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) int retweetCount;
@property (nonatomic) BOOL retweeted;
@property (strong, nonatomic) User *user; //contains name and screenname of the user
@property (strong, nonatomic) NSString * createdAtString;

//For Retweets
@property (strong, nonatomic) User *retweetedByUser;//user who retweeted if the tweet is retweeted

+(NSMutableArray*) tweetsWithArray: (NSArray* )dictionaries;


@end

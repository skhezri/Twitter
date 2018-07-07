//
//  Tweet.m
//  twitter
//
//  Created by Sophia Khezri on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "User.h"
#import "DateTools.h"

@implementation Tweet


-(instancetype) initWithDictionary:(NSDictionary *) dictionary{
    self=[super init];
    if(self){
        //is this a re-tweet
        NSDictionary * originalTweet= dictionary[@"retweeted_status"];
        if(originalTweet!= nil){
            NSDictionary * userDictionary = dictionary[@"user"];
            self.retweetedByUser= [[User alloc] initWithDictionary:userDictionary];
            
            dictionary= originalTweet;
    }
        
        self.idStr= dictionary[@"id_str"];
        self.text=dictionary[@"text"];
        self.favoriteCount= [dictionary[@"favorite_count"]intValue];
        self.favorited=[dictionary[@"favorited"]boolValue];
        self.retweetCount=[dictionary[@"retweet_count"] intValue];
        self.retweeted= [dictionary[@"retweeted"] boolValue];
        
        NSDictionary * user= dictionary[@"user"];
        self.user= [[User alloc] initWithDictionary:user];
        
        //Format createdAt date
        NSString * createdAtOriginalString= dictionary[@"created_at"];
        NSDateFormatter * formatter= [[NSDateFormatter alloc] init];
        formatter.dateFormat= @"E MMM d HH:mm:ss Z y";
        //convert string to date
        NSDate * date= [formatter dateFromString: createdAtOriginalString];
        formatter.dateStyle= NSDateFormatterShortStyle;
        formatter.timeStyle= NSDateFormatterNoStyle;
        NSString * timeAgo= [NSDate shortTimeAgoSinceDate:date];
        //Convert Date to String
        self.createdAtString=timeAgo;
        self.createdAtString2= [formatter stringFromDate: date];
       // NSString *finalString= createdAtOriginalString.timeAgoSinceNow;
    
}

    return self;
}
+(NSMutableArray*) tweetsWithArray: (NSArray* )dictionaries{
    NSMutableArray *tweets= [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;

}
@end

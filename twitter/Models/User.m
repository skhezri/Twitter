//
//  User.m
//  twitter
//
//  Created by Sophia Khezri on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

//initializes the user object 
-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self=[super init];
    if(self){
        self.name=dictionary[@"name"];
        NSString * twitterHandle= dictionary[@"screen_name"];
        self.screenName= [ NSString stringWithFormat:@"%@%@", @"@", twitterHandle];
        self.profilePic=[NSURL URLWithString: dictionary[@"profile_image_url_https"]];
    }
    
    return self;
}


@end

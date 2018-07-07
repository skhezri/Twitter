//
//  SingleTweetViewController.h
//  twitter
//
//  Created by Sophia Khezri on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface SingleTweetViewController : UIViewController

@property (nonatomic, weak) Tweet* tweet;
@property (weak, nonatomic) IBOutlet UIButton *rtButton;
@property (weak, nonatomic) IBOutlet UIButton *favButton;

@end

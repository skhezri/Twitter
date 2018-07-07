//
//  ComposeViewController.h
//  twitter
//
//  Created by Sophia Khezri on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//ComposeViewController

#import <UIKit/UIKit.h>
#import "Tweet.h"

@protocol ComposeViewControllerDelegate

-(void)didTweet:(Tweet *) tweet;

@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *characterCount;
@property (weak, nonatomic) IBOutlet UITextView *composeText;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

@end

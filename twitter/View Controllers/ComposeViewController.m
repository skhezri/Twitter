//
//  ComposeViewController.m
//  twitter
//
//  Created by Sophia Khezri on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "TimelineViewController.h"
#import "Tweet.h"
#import "TweetCell.h"


@interface ComposeViewController (){
    
}
@end

@implementation ComposeViewController



//Loads the view controller when the user tries to compose his/her own tweet
- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeText.delegate=self;
}


//Method that will count down the number of characters left when composing a tweet
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    int characterLimit = 140;
    // Construct what the new text would be if we allowed the user's latest edit
    NSString *newText = [self.composeText.text stringByReplacingCharactersInRange:range withString:text];
    // TODO: Update Character Count Label
    self.characterCount.text=[NSString stringWithFormat:@"%d", 140-self.composeText.text;.length]
    // The new text should be allowed? True/False
    return newText.length < characterLimit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//Connects to the button that will exit out of the compose view controller
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
//Connects to the button that will submit a tweet
- (IBAction)tweetButton:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeText.text completion:^(Tweet * tweet, NSError * error) {
        if(error){
             NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        } else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
        [self dismissModalViewControllerAnimated:YES];
    }];
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

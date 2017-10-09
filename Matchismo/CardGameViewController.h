//
//  ViewController.h
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetButtion;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSwitch;
@property (nonatomic) int gameMode;
@property (nonatomic) int x;

- (IBAction)flip:(UIButton *)sender;
- (IBAction)reset:(id)sender;
- (IBAction)changeMode:(id)sender;
- (void)updateUI;

@end

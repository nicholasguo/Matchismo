//
//  ViewController.m
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end
@implementation CardGameViewController

- (IBAction)flip:(UIButton *)sender {
    self.modeSwitch.enabled = NO;
    int chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex WithGameMode: self.gameMode];
    [self updateUI];
}

- (IBAction)reset:(id)sender
{
    self.game = nil;
    [self updateUI];
    self.modeSwitch.enabled = YES;
}

- (IBAction)changeMode:(id)sender
{
    self.gameMode = self.modeSwitch.selectedSegmentIndex + 2;
}

- (CardMatchingGame *)game
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",
     NSStringFromSelector(_cmd)]; return nil;
}
- (void) updateUI
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",
     NSStringFromSelector(_cmd)];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

@end

//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Nicholas Guo on 8/10/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "SetCardGameViewController.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

@synthesize game = _game;

// Archer
// Draw cards at the beginning
- (void)viewDidLoad
{
    [self updateUI];
}

-(CardMatchingGame *)game
{
    if(!_game)_game = [[SetCardMatchingGame alloc]initWithCardCount:[self.cardButtons count]];
    self.gameMode = 3;
    return _game;
}

- (void) updateUI
{
    for (int i = 0; i < [self.cardButtons count]; i++) {
        UIButton *button = (UIButton *)[self.cardButtons objectAtIndex:i];
        SetCard *card = (SetCard *)[self.game cardAtIndex:i];
        button.enabled = !card.isMatched;
        
        // Archer:
        if (card.isMatched) {
            [button setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            [button setAttributedTitle:nil forState:UIControlStateNormal];
            continue;
        } else {
            [button setAttributedTitle:card.contents forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        }
        
        
        if(card.chosen) {
//            [button setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
//            [button setAttributedTitle:card.contents forState:UIControlStateNormal];
            button.alpha = 0.7;
        }
        else{
//            [button setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
//            [button setAttributedTitle: @"" forState:UIControlStateNormal];
            button.alpha = 1;
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


@end
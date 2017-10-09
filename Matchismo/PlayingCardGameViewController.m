//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Nicholas Guo on 8/10/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "PlayingCardGameViewController.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

@synthesize game = _game;

-(CardMatchingGame *)game
{
    if(!_game)_game = [[PlayingCardMatchingGame alloc]initWithCardCount:[self.cardButtons count]];
    return _game;
}

@synthesize gameMode = _gameMode;

-(int)gameMode
{
    if(!_gameMode)_gameMode = 2;
    return _gameMode;
}

- (void) updateUI
{
    for (int i = 0; i < [self.cardButtons count]; i++) {
        UIButton *button = (UIButton *)[self.cardButtons objectAtIndex:i];
        Card *card = [self.game cardAtIndex:i];
        [button setTitle:[self titleForCard:card] forState: UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? (NSString *)card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen? @"cardfront" : @"cardback"];
}

@end

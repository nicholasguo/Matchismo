//
//  PlayingCardGameViewController.h
//  Matchismo
//
//  Created by Nicholas Guo on 8/10/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardMatchingGame.h"

@interface PlayingCardGameViewController : CardGameViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

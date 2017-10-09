//
//  SetCardGameViewController.h
//  Matchismo
//
//  Created by Nicholas Guo on 8/10/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "CardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCardMatchingGame.h"

@interface SetCardGameViewController : CardGameViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

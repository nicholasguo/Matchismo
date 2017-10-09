//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count;
-(void)chooseCardAtIndex:(NSUInteger)index WithGameMode:(NSUInteger)gameMode;
-(Card *)cardAtIndex:(NSUInteger)index;

@property(readonly,nonatomic)NSInteger score;
@property(strong,nonatomic)NSMutableArray *cards;//of cards
@property(strong,nonatomic)Deck *deck;


@end

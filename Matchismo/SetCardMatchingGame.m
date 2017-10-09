//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Nicholas Guo on 8/10/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "SetCardMatchingGame.h"

@implementation SetCardMatchingGame

@synthesize deck = _deck;

- (Deck *)deck
{
    if (!_deck) _deck = [[SetCardDeck alloc] init];
    return _deck;
}

-(instancetype)initWithCardCount:(NSUInteger)count
{
    self=[super init];
    if(self){
        for(int i=0;i<count;i++){
            Card *card= [self.deck drawRandomCard];
            if(card)[self.cards addObject:card];
            else{
                self=nil;
                break;
            }
        }
    }
    return self;
}

@end

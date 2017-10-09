//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic,readwrite)NSInteger score;
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

-(NSMutableArray *)chosenCards
{
    if(!_chosenCards)_chosenCards = [[NSMutableArray alloc] init];
    return _chosenCards;
}

-(NSMutableArray*)cards
{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return self;
}

-(Card*)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count])?self.cards[index]:nil;
}


-(void)chooseCardAtIndex:(NSUInteger)index WithGameMode:(NSUInteger)gameMode
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
            [self.chosenCards removeObject:card];
        }
        else{
            self.score -= 1;//penalty for choosing
            [self.chosenCards addObject:card];
            card.chosen=YES;
        }
    }
    if([self.chosenCards count] == gameMode){
        int NEW_SCORE = [[card class] judgeScore: self.chosenCards];
        for(Card *usedCard in self.chosenCards){
            if(NEW_SCORE != 0){
                usedCard.matched = YES;
            }
            else{
                usedCard.chosen = NO;
            }
        }
        self.chosenCards = nil;
        if(NEW_SCORE == 0){
            self.score -= 2;//mismatch penalty
            card.chosen = YES;//keep bad card chosen;
            [self.chosenCards addObject:card];
        }
        else self.score += NEW_SCORE;// points earned
    }
}

@end

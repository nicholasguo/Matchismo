//
//  Card.m
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "Card.h"
#import "PlayingCard.h"

@implementation Card

-(int)match:(NSArray *)otherCards{
    int score=0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    return score;
}

+ (NSUInteger) judgeScore:(NSMutableArray *)cards
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return 0;
}

-(NSString *)titleForCard
{
    return self.isChosen ? self.contents : @"";
}

-(UIImage *)backgroundImageForCard
{
    return [UIImage imageNamed:self.isChosen ? @"cardfront" : @"cardback" ];
}

@end


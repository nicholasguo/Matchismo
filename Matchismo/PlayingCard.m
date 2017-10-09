//
//  PlayingCard.m
//  Matchismo
//
//  Created by Nicholas Guo on 7/27/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards{
    int score=0;
    if([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score =4;
        }
        else if([otherCard.suit isEqualToString:self.suit]){
            score =1;
        }
    }
    return score;
}

-(NSString *)contents{
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit =_suit;

+(NSArray *)validSuits{
    return @[@"♣️",@"♠️",@"♥️",@"♦️"];
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",];
}

+(NSUInteger) maxRank{ return [[self rankStrings] count] -1;}

-(void)setRank:(NSUInteger)rank{
    if(rank<=[PlayingCard maxRank]){
        _rank=rank;
    }
}

+ (NSUInteger) judgeScore:(NSMutableArray *)cards
{
    NSUInteger rankScore = 0; NSUInteger suitScore = 0; NSUInteger rank = 0; NSString *suit = nil;
    for (PlayingCard *card in cards) {
        if (rank == 0 || !suit) {
            rank = card.rank;
            suit = card.suit;
            rankScore = 1;
            suitScore = 1;
            continue;
        }
        if (rankScore != 0) {
            if (card.rank == rank) {
                rankScore *= 12;
            }
            else {
                rankScore = 0;
            }
        }
        if (suitScore != 0) {
            if([card.suit isEqualToString:suit]) {
                suitScore *= 6; }
            else {
                suitScore = 0;
            }
        }
    }
    return rankScore + suitScore;
}


@end

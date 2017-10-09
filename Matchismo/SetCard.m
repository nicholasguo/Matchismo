//
//  SetCard.m
//  Matchismo
//
//  Created by Nicholas Guo on 8/9/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize contents;

-(NSAttributedString *)contents
{
    float alpha;
    UIColor *color = nil;
    NSString *string;
    NSMutableAttributedString *attributedString;
    
    switch (self.shade) {
        case solid:
            alpha = 1.0;
            break;
        case striped:
            alpha = 0.6;
            break;
        case opened:
            alpha = 0.2;
    }
    
    switch (self.color) {
        case red:
            color = [UIColor redColor];
            break;
        case yellow:
            color = [UIColor yellowColor];
            break;
        case purple:
            color = [UIColor purpleColor];
    }
    color = [color colorWithAlphaComponent:alpha];
    
    switch (self.shape) {
        case circle:
            string = @"●";
            break;
        case square:
            string = @"■";
            break;
        case triangle:
            string = @"▲";
    }
    
    switch (self.number) {
        case 0:
            break;
        case 1:
            string = [NSString stringWithFormat: @"%@%@",string,string ];
            break;
        case 2:
            string = [NSString stringWithFormat: @"%@%@%@",string,string,string ];
    }
    
    attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, [string length])];
    return attributedString;
}

+(BOOL) _matchValue:(int)A and: (int)B and:(int)C
{
    return !((A+B+C)%3);//all diff or same => 0 mod 3
}

+ (NSUInteger) judgeScore:(NSArray *)cards
{
    int score = 0;
    if (cards && [cards count] == 3) {
        SetCard *cardA = (SetCard *)[cards objectAtIndex:0];
        SetCard *cardB = (SetCard *)[cards objectAtIndex:1];
        SetCard *cardC = (SetCard *)[cards objectAtIndex:2];
        BOOL shapeMatched = [[self class] _matchValue:cardA.shape and:cardB.shape and:cardC.shape];
        BOOL colorMatched = [[self class] _matchValue:cardA.color and:cardB.color and:cardC.color];
        BOOL shadeMatched = [[self class] _matchValue:cardA.shade and:cardB.shade and:cardC.shade];
        BOOL numberMatched = [[self class] _matchValue:cardA.number and:cardB.number and:cardC.number];
        // implement + (BOOL) _matchValue:(int)A and:(int)B and:(int)C; for yourself
        if (shapeMatched && colorMatched && shadeMatched && numberMatched) {
            score = 4; }
    }
    return score; }

@end

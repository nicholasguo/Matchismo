//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Nicholas Guo on 8/9/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "SetCardDeck.h"

@implementation SetCardDeck

-(instancetype)init{
    self=[super init];
    if(self){
        for (int i=0; i<3; i++) {
            for (int j=0; j<3; j++) {
                for (int k=0; k<3; k++) {
                    for (int l=0; l<3; l++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.shape = i;
                        card.shade = k;
                        card.color = j;
                        card.number = l;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end

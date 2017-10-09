//
//  SetCard.h
//  Matchismo
//
//  Created by Nicholas Guo on 8/9/14.
//  Copyright (c) 2014 Nicholas Guo. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

enum shape{ circle = 0, triangle, square };
enum shade{ solid = 0, striped, opened };
enum color{ red = 0, yellow, purple };

@property (nonatomic) enum shape shape;
@property (nonatomic) enum shade shade;
@property (nonatomic) enum color color;
@property (nonatomic) NSUInteger number;

@property (strong, nonatomic, readonly) NSAttributedString* contents;

@end

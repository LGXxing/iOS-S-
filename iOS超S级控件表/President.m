//
//  President.m
//  大合集
//
//  Created by 123 on 15-8-16.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "President.h"
#define K_NAME @"Name"
#define K_FROMYEAR @"FromYear"
#define K_TOYEAR @"ToYear"
#define K_PARTY @"Party"


@implementation President

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:K_NAME];
    [aCoder encodeObject:self.fromYear forKey:K_FROMYEAR];
    [aCoder encodeObject:self.toYear forKey:K_TOYEAR];
    [aCoder encodeObject:self.party forKey:K_PARTY];
    
    
    
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.name = [aDecoder decodeObjectForKey:K_NAME];
        self.fromYear = [aDecoder decodeObjectForKey:K_FROMYEAR];
        self.toYear = [aDecoder decodeObjectForKey:K_TOYEAR];
        self.party = [aDecoder decodeObjectForKey:K_PARTY];
        
        
        
        
        
        
        
    }
    
    return self;
    
}



@end

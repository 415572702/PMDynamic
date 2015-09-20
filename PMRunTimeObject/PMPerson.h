//
//  PMPerson.h
//  PMRunTimeObject
//
//  Created by PeiZiming on 15/9/21.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "PMAutoPropertyManager.h"

@interface PMPerson : PMAutoPropertyManager {

}

@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthday;

@end

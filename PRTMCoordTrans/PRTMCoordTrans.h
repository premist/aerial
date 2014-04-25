//
//  PRTMCoordTrans.h
//  PRTMCoordTrans
//
//  Created by Premist on 4/25/14.
//  Copyright (c) 2014 Premist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "proj_api.h"

@interface PRTMCoordTrans : NSObject


+ (NSArray*)WGS84IntoTM127WithLatitude:(double)y longitude:(double)x;
+ (NSArray*)WGS84IntoTM128WithLatitude:(double)y longitude:(double)x;
//+ (NSArray*)TM127IntoWGS84WithLatitude:(double)latitude longitude:(double)longitude;
//+ (NSArray*)TM128IntoWGS84WithLatitude:(double)latitude longitude:(double)longitude;

@end

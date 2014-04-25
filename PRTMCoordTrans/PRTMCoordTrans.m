//
//  PRTMCoordTrans.m
//  PRTMCoordTrans
//
//  Created by Premist on 4/25/14.
//  Copyright (c) 2014 Premist. All rights reserved.
//

#import "PRTMCoordTrans.h"
#import "proj_api.h"

@implementation PRTMCoordTrans
+ (NSArray*)WGS84IntoTM127WithLatitude:(double)y longitude:(double)x  {
    
    projPJ pj_WGS84, pj_TM127;
    
    pj_WGS84 = pj_init_plus("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
    pj_TM127 = pj_init_plus("+proj=tmerc +lat_0=38 +lon_0=127.002890277 +ellps=bessel +x_0=200000 +y_0=500000 +k=1.0 +towgs84=-146.43,507.89,681.46 +units=m +no_defs");
    
    x *= DEG_TO_RAD;
    y *= DEG_TO_RAD;
    
    pj_transform(pj_WGS84, pj_TM127, 1, 1, &x, &y, NULL);
    
    return @[@(x), @(y)];
    
}

+ (NSArray*)WGS84IntoTM128WithLatitude:(double)y longitude:(double)x {
    
    projPJ pj_WGS84, pj_TM128;
    
    pj_WGS84 = pj_init_plus("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
    pj_TM128 = pj_init_plus("+proj=tmerc +lat_0=38 +lon_0=127.002890277 +ellps=bessel +x_0=200000 +y_0=500000 +k=1.0 +towgs84=-146.43,507.89,681.46 +units=m +no_defs");
    
    x *= DEG_TO_RAD;
    y *= DEG_TO_RAD;
    
    pj_transform(pj_WGS84, pj_TM128, 1, 1, &x, &y, NULL);
    
    return @[@(x), @(y)];
}

@end

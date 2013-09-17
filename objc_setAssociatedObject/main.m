//
//  main.m
//  objc_setAssociatedObject
//
//  Created by Sinosoft on 9/17/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        static char overviewKey;
        NSArray *array =[[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
        //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
        NSString * overview = [[NSString alloc] initWithFormat:@"%@",@"First three numbers"];
        objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
        [overview release];
        
        NSString *associatedObject = (NSString *)objc_getAssociatedObject(array, &overviewKey);
        NSLog(@"associatedObject:%@", associatedObject);
        
        objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
        [array release];
    }
    return 0;
}


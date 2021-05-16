#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
        NSMutableArray *numArray = [NSMutableArray new];
        NSMutableArray *strArray = [NSMutableArray new];
        
        
        for (NSObject* subArr in array) {
            if ([subArr isKindOfClass: NSArray.class]) {
                for (NSObject* obj in (NSArray*)subArr)
                {
                    if ([obj isKindOfClass: NSNumber.class]) {
                        [numArray addObject:obj];
                        continue;
                    }
                    
                    if ([obj isKindOfClass: NSString.class]) {
                        [strArray addObject:obj];
                    }
                }
            }
            else return @[];
        }
        
        if (numArray.count == 0) {
            [strArray sortUsingComparator:^NSComparisonResult(id a, id b) {
                if ([(NSString*)a compare:(NSString*)b] == NSOrderedAscending)
                    return NSOrderedAscending;
                else return NSOrderedDescending;
            }];
            return strArray;
        }
        else
            [strArray sortUsingComparator:^NSComparisonResult(id a, id b) {
            if ([(NSString*)a compare:(NSString*)b] == NSOrderedDescending)
                return NSOrderedAscending;
            else return NSOrderedDescending;
        }];
        
        
        [numArray sortUsingComparator:^NSComparisonResult(id a, id b){
            if ([(NSNumber*) a compare: (NSNumber*)b] == NSOrderedAscending)
                return NSOrderedAscending;
            else return NSOrderedDescending;
        }];
        if (strArray.count == 0)
        {
            return numArray;
        }
        
        return @[numArray, strArray];

}

@end

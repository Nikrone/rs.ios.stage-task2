#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray == nil || numbersArray.count == 0 ) {
        return @"";
    }
    
    for (id i in numbersArray) {
        if ([i intValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if ([i intValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
    }
    
    
    NSMutableString *result = [[NSMutableString alloc] init];
    
    for (int v = 0; v < 4; v ++) {
        if (v < numbersArray.count ) {
            [result appendFormat:@"%@", [[numbersArray objectAtIndex:v] stringValue]];
        } else {
            [result appendString:@"0"];
        }
        if (v < 3) {
            [result appendString:@"."];
        }
    }
    
    return result;
}

@end

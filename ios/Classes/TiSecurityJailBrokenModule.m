/**
 * TiSecurityJailBroken
 *
 * Created by Ben Bahrenburg
 * Copyright (c) 2018 Your Company. All rights reserved.
 */

#import "TiSecurityJailBrokenModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiSecurityJailBrokenModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"028b6051-d45b-4327-b613-7b4bc215a2ba";
}

// This is generated for your module, please do not change it
- (NSString *)moduleId
{
  return @"Ti.Security.JailBroken";
}

#pragma mark Lifecycle

- (void)startup
{
    // This method is called when the module is first loaded
    // You *must* call the superclass
    [super startup];
    
}

#pragma Public APIs

-(NSNumber *) isJailBroken:(id)unused
{
#if !(TARGET_IPHONE_SIMULATOR)
    return [NSNumber numberWithBool: [self verifyJailBrokenStatus]];
#endif
    
    return [NSNumber numberWithBool: NO];
    
}

-(BOOL) hasFileAccess
{
    FILE *file = fopen("/Applications/Cydia.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/bin/bash", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/usr/sbin/sshd", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/etc/apt", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/usr/bin/ssh", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    
    return NO;
}

-(BOOL) hasFilePaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:@"/Applications/Cydia.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/bin/bash"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/usr/sbin/sshd"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/etc/apt"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/usr/bin/ssh"]) {
        return YES;
    }
    
    return NO;
}

-(BOOL) canWriteOutsideSandbox
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Check if the app can access outside of its sandbox
    NSError *error = nil;
    NSString *stringToBeWritten = @"Jailbreak Test.";
    NSString *path = @"/private/";
    [path stringByAppendingString:[[NSUUID UUID] UUIDString]];
    [path stringByAppendingString: @".txt"];
    [stringToBeWritten writeToFile: path atomically:YES
                          encoding:NSUTF8StringEncoding error:&error];
    
    if (!error) {
        [fileManager removeItemAtPath: path error:nil];
        return YES;
    }
    return NO;
}

-(BOOL) verifyJailBrokenStatus
{
    
#if !(TARGET_IPHONE_SIMULATOR)
    
    if ([self hasFileAccess] || [self hasFilePaths] || [self canWriteOutsideSandbox]) {
        return YES;
    }
    
    // Check if the app can open a Cydia's URL scheme
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
        return YES;
    }
    
#endif
    
    return NO;
    
}

@end

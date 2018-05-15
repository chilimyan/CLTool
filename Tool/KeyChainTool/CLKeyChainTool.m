
//
//  CLKeyChainTool.m
//  TIMDemo
//
//  Created by Apple on 2017/12/5.
//  Copyright © 2017年 chilim. All rights reserved.
//

#import "CLKeyChainTool.h"

@implementation CLKeyChainTool

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)cl_saveData:(id)data service:(NSString *)service{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    CFDictionaryRef dict = (__bridge_retained CFDictionaryRef)keychainQuery;
    //Delete old item before add new item
    SecItemDelete(dict);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    
    SecItemAdd(dict,NULL);
    CFBridgingRelease(dict);
}

+ (id)cl_loadData:(NSString *)service{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)cl_deleteData:(NSString *)service{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    CFDictionaryRef dict = (__bridge_retained CFDictionaryRef)keychainQuery;
    SecItemDelete(dict);
    CFBridgingRelease(dict);
}

@end

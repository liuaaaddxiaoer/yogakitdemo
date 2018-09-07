//
//  main.m
//  yogakitDemo
//
//  Created by 刘小二 on 2018/9/6.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

// From here to end of file added by Injection Plugin //

#ifdef DEBUG
#define INJECTION_PORT 31452
static char _inMainFilePath[] = __FILE__;
static const char *_inIPAddresses[] = {"192.168.44.50", "127.0.0.1", 0};

#define INJECTION_ENABLED
#import "/tmp/injectionforxcode/BundleInjection.h"
#endif

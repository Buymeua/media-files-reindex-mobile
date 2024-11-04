#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(MyMediaScanner, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(scanFile:(NSString *)path)

RCT_EXTERN_METHOD(downloadFile:(NSString *)url
                 outputPath:(NSString *)outputPath
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end

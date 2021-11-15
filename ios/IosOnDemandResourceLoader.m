#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(IosOnDemandResourceLoader, NSObject)

RCT_EXTERN_METHOD(loadResourcesByTag:(NSString)tag
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end

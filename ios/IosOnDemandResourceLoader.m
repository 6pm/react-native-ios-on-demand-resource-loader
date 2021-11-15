#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(IosOnDemandResourceLoader, NSObject)

RCT_EXTERN_METHOD(loadResourcesByTag:(NSString)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)

@end

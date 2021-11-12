#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(IosOnDemandResourceLoader, NSObject)

RCT_EXTERN_METHOD(loadResourcesByTag:(string)tag
                 withResolver:(@escaping)resolve
                 withRejecter:(@escaping)reject)

@end

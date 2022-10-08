#import "YorXiuCommonPlugin.h"
#if __has_include(<yor_xiu_common/yor_xiu_common-Swift.h>)
#import <yor_xiu_common/yor_xiu_common-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "yor_xiu_common-Swift.h"
#endif

@implementation YorXiuCommonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYorXiuCommonPlugin registerWithRegistrar:registrar];
}
@end

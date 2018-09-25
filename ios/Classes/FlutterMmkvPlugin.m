#import "FlutterMmkvPlugin.h"
#import <flutter_mmkv/flutter_mmkv-Swift.h>

@implementation FlutterMmkvPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMmkvPlugin registerWithRegistrar:registrar];
}
@end

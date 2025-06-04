#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

#if __has_include("EmojiKeyboard/EmojiKeyboard-Swift.h")
#import "EmojiKeyboard/EmojiKeyboard-Swift.h"
#else
#import "EmojiKeyboard-Swift.h"
#endif


@interface EmojiKeyboardViewManager : RCTViewManager<EmojiKeyboardDelegate>
@end

@implementation EmojiKeyboardViewManager

RCT_EXPORT_MODULE(EmojiKeyboardView)

RCT_EXPORT_VIEW_PROPERTY(onEmojiSelected, RCTDirectEventBlock)

- (UIView *)view
{
  return [[EmojiKeyboardViewImpl alloc] initWithDelegate:self];
}

- (void)didGetEmojiWithEmoji:(NSString *)emoji reactTag:(NSNumber *)reactTag {
  auto event = [[OnEmojiSelectedEvent alloc] initWithReactTag:reactTag emoji:emoji];
  [self.bridge.eventDispatcher sendEvent:event];
}

@end

#import "EmojiKeyboardView.h"

#import <react/renderer/components/RNEmojiKeyboardViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNEmojiKeyboardViewSpec/EventEmitters.h>
#import <react/renderer/components/RNEmojiKeyboardViewSpec/Props.h>
#import <react/renderer/components/RNEmojiKeyboardViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

#if __has_include("EmojiKeyboard/EmojiKeyboard-Swift.h")
#import "EmojiKeyboard/EmojiKeyboard-Swift.h"
#else
#import "EmojiKeyboard-Swift.h"
#endif

using namespace facebook::react;

@interface EmojiKeyboardView () <RCTEmojiKeyboardViewViewProtocol, EmojiKeyboardDelegate>

@end

@implementation EmojiKeyboardView {
  EmojiKeyboardViewImpl * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<EmojiKeyboardViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const EmojiKeyboardViewProps>();
    _props = defaultProps;

    _view = [[EmojiKeyboardViewImpl alloc] initWithDelegate:self];

    self.contentView = _view;
  }

  return self;
}

- (void)didGetEmojiWithEmoji:(NSString *)emoji reactTag:(NSNumber *)reactTag {
  auto eventEmitter = std::static_pointer_cast<const EmojiKeyboardViewEventEmitter>(_eventEmitter);
  const char* utf8String = [emoji UTF8String];
  if (eventEmitter) {
    eventEmitter->onEmojiSelected(EmojiKeyboardViewEventEmitter::OnEmojiSelected {
      .emoji = std::string { utf8String }
    });
  }
}

Class<RCTComponentViewProtocol> EmojiKeyboardViewCls(void)
{
  return EmojiKeyboardView.class;
}

@end

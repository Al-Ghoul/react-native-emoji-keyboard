import { View } from 'react-native';
import EmojiKeyboardView from './EmojiKeyboardViewNativeComponent';
import type { EmojiKeyboardProps } from './types';

export default function EmojiKeyboard({
  children,
  containerStyle,
  emojiViewStyle,
  onEmojiSelected,
}: EmojiKeyboardProps) {
  return (
    <View style={[containerStyle ? containerStyle : defaultStyles.container]}>
      {children}
      <EmojiKeyboardView
        onEmojiSelected={({ nativeEvent: { emoji } }) => {
          onEmojiSelected(emoji);
        }}
        style={[emojiViewStyle ? emojiViewStyle : defaultStyles.emojiContainer]}
      />
    </View>
  );
}

const defaultStyles = {
  container: {
    flex: 1,
  },
  emojiContainer: {
    flex: 1,
  },
};

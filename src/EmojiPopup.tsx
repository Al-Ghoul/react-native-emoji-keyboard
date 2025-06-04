import { View } from 'react-native';
import EmojiPopupView from './EmojiPopupViewNativeComponent';
import type { EmojiPopupProps } from './types';

const EmojiPopup = ({
  children,
  containerStyle,
  emojiViewStyle,
  onEmojiSelected,
}: EmojiPopupProps) => {
  return (
    <View style={[containerStyle ? containerStyle : defaultStyles.container]}>
      {children}
      <EmojiPopupView
        onEmojiSelected={({ nativeEvent: { emoji } }) => {
          onEmojiSelected(emoji);
        }}
        style={[emojiViewStyle ? emojiViewStyle : defaultStyles.emojiContainer]}
      />
    </View>
  );
};

const defaultStyles = {
  container: {
    flex: 1,
  },
  emojiContainer: {
    flex: 1,
  },
};

export default EmojiPopup;

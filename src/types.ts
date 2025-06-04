import type { ReactNode } from 'react';
import type { ViewProps } from 'react-native';

export interface EmojiPopupProps {
  /*
   * A function that will be called when an emoji is selected.
   */
  onEmojiSelected: (emoji: string) => void;
  /*
   * The style of the emoji view.
   */
  emojiViewStyle?: ViewProps['style'];
  /*
   * The style of the container view.
   */
  containerStyle?: ViewProps['style'];
  /*
   * The children of the emoji popup (rendered before the emoji view).
   */
  children?: ReactNode;
}

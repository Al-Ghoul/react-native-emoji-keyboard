import { useState } from 'react';
import { View, StyleSheet, Text, Pressable } from 'react-native';
import { EmojiPopup } from 'react-native-emoji-popup';

export default function App() {
  const [emoji, setEmoji] = useState('🫡');

  const setEmojiHandler = (emojiInput: string) => {
    setEmoji((prev) => prev + emojiInput);
  };

  const clearInput = () => {
    setEmoji('');
  };

  const deleteLastEmoji = () => {
    if (emoji.length > 0) {
      setEmoji(emoji.slice(0, -2));
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.emojiText}>{emoji}</Text>
      <EmojiPopup
        containerStyle={styles.emojiContainer}
        emojiViewStyle={styles.emojiView}
        onEmojiSelected={setEmojiHandler}
      >
        <View style={styles.buttonsView}>
          <Pressable style={styles.buttonText} onPress={clearInput}>
            <Text>Clear</Text>
          </Pressable>
          <Pressable style={styles.buttonText} onPress={deleteLastEmoji}>
            <Text>Delete</Text>
          </Pressable>
        </View>
      </EmojiPopup>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  buttonsView: {
    flexDirection: 'row',
    justifyContent: 'center',
    gap: 10,
  },
  buttonText: {
    color: 'white',
    textAlign: 'center',
    backgroundColor: '#2196F3',
    padding: 10,
    borderRadius: 5,
  },
  emojiText: {
    fontSize: 30,
    textAlign: 'center',
  },
  emojiContainer: {
    flex: 1,
    justifyContent: 'flex-end',
  },
  emojiView: {
    height: 500,
  },
});

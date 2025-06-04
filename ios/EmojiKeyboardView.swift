import UIKit
import MCEmojiPicker
import React

@objc public protocol EmojiKeyboardDelegate {
  func didGetEmoji(emoji: String, reactTag: NSNumber?)
}

@objc
public class EmojiKeyboardViewImpl: UIView, MCEmojiPickerDelegate {
  private var delegate: EmojiKeyboardDelegate?
  @objc var onEmojiSelected: RCTDirectEventBlock?

  public override func layoutSubviews() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    self.addGestureRecognizer(tapGesture)
  }

  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    presentEmojiPicker()
  }

  @objc public convenience init(delegate: EmojiKeyboardDelegate) {
    self.init()
    self.delegate = delegate
  }

  @objc public func presentEmojiPicker() {
    let emojiPicker = MCEmojiPickerViewController()
    let reactRootVC = reactViewController()
    emojiPicker.sourceView = self
    emojiPicker.delegate = self
    reactRootVC?.present(emojiPicker, animated: true)
  }

  // MARK: MCEmojiPickerDelegate

  public func didGetEmoji(emoji: String) {
    delegate?.didGetEmoji(emoji: emoji, reactTag: self.reactTag)
  }
}


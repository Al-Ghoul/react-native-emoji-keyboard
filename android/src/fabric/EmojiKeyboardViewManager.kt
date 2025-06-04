package com.emoji_keyboard

import com.facebook.react.common.MapBuilder
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.UIManagerHelper
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.EmojiKeyboardViewManagerInterface
import com.facebook.react.viewmanagers.EmojiKeyboardViewManagerDelegate

@ReactModule(name = EmojiKeyboardViewManager.NAME)
class EmojiKeyboardViewManager : SimpleViewManager<EmojiKeyboardView>(),
  EmojiKeyboardViewManagerInterface<EmojiKeyboardView> {
  private val mDelegate: ViewManagerDelegate<EmojiKeyboardView> = EmojiKeyboardViewManagerDelegate(this)

  override fun getDelegate(): ViewManagerDelegate<EmojiKeyboardView> {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): EmojiKeyboardView {
    val view = EmojiKeyboardView(context)
    val eventDispatcher = UIManagerHelper.getEventDispatcherForReactTag(context, view.id)
    view.onEmojiSelectedListener = { emoji ->
      eventDispatcher?.dispatchEvent(EmojiSelectedEvent(viewTag = view.id, emoji))
    }
    return view
  }

  override fun getExportedCustomDirectEventTypeConstants(): MutableMap<String, Any>? {
    return MapBuilder.of(
      EmojiSelectedEvent.EVENT_NAME,
      MapBuilder.of("registrationName", "onEmojiSelected"),
    )
  }

  companion object {
    const val NAME = "EmojiKeyboardView"
  }
}

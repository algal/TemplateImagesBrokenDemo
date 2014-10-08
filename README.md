# TemplateImagesBrokenDemo

PDF vector template images are not rendered properly by UIImageView, when the UIImageView is loaded from a xib.

## OpenRadar

OpenRadar link for this bug: http://openradar.appspot.com/radar?id=5334033567318016

## Huh?

This example project shows that on iOS8.0 with Xcode 6.01, PDF vector
template images do not work properly with UIImageViews, when those
image views are loaded from a xib.

A PDF vector image is an image added as a PDF to an Xcode image set,
where the image set's Types attribute has been set to "vectors".

A template image is an image set where the Render As attribtue has
been set to "Template Image".

UIImageView's tintColor documentation says that:

```The default is nil. If a non-nil value is specified, the color is applied to any template images attached to the image view.```

However, as one can see in the screenshot, the tintColor is applied
only sporadically to the UIImageViews on the right of the cell. It is,
however, applied consistently to the UIButtons on the left.

<div style="text-align: center">
<img width="50%" src="./screenshot.png"></img>
</div>

If you flip the switch so that image views' images are set manually,
the problem goes away for new images. If you start the app with the
switch in a different default position (by setting a different initial
value for the global variable `shouldSetImagesManually`, then the
problem does not appear).

## workarounds

## 1. UIButton

UIButton can display an image and it does respect tintColor. So one
workaround is just to use UIButtons (of type custom) instead of
UIImageViews. However you need to remember to set the contentMode
correctly on the button and its embedded UIImageView, to get the right
effect.

## 1. Manually set the image

UIImageView will apply the tintColor correctly if you manually set the
image. The problem only seems to appear in image views that have just
been deserialized from a xib or storyboard. Presumably whatever
mechanism is used to deserialize the image view with its initial
image, does not apply the same logic that is used when you manually
set the image.

Therefore one workaround is, in `awakeFromNib`, to set
UIImageView.image to its own value, with code as follows. You need the
intermediate step of nilling the property, in order to ensure the code
is not optimized away

<pre>
        let image = self.templateImageView.image
        self.templateImageView.image = nil
        self.templateImageView.image = image
</pre>

# PartialTransparentMaskView
A mask view with assignable transparent areas.

Override DrawRect and use CGContextClearRect to clear interested areas, so that be able to make a mask view with partial transparent areas.

This class inherents from ExtensionScrollArea, so that you can scroll the masked UIScrollView.

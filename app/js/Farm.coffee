((root, targetNS, localName, imageId, imageWidth, imageHeight, screenWidth, screenHeight) ->

  root[targetNS] = root[targetNS] || {}

  # This Bitmap class essentially contains the raw image.
  ImageBitmap = () ->
    @initialize(root[targetNS].images[imageId])
    return

  ImageBitmap.prototype = new createjs.Bitmap()
  ImageBitmap.prototype.nominalBounds = new createjs.Rectangle(0, 0, imageWidth, imageHeight)

  # The scale factors required to size the image to the screen.
  scaleX = screenWidth / imageWidth
  scaleY = screenHeight / imageHeight

  # This Container scales the bitmap to the screen resolution.
  ImageContainer = () ->
    @initialize()
    bitmap = new ImageBitmap();
    bitmap.setTransform(0, 0, scaleX, scaleY)
    @addChild(bitmap)
    return

  ImageContainer.prototype = new createjs.Container()
  ImageContainer.prototype.nominalBounds = new createjs.Rectangle(0, 0, screenWidth, screenHeight)

  # This is the constructor entry point for the Island.
  root[targetNS][localName] = () ->
    @initialize()
    container = new ImageContainer()
    container.setTransform(0, 0, 1, 1, 0, 0, 0, 0, 0)
    @addChild(container)
    return

  root[targetNS][localName].prototype = new createjs.Container()
  root[targetNS][localName].prototype.nominalBounds = new createjs.Rectangle(0, 0, screenWidth, screenHeight)
  return

)(this, "SavvyParrot", "Farm", 'img-farmhouse', 1500, 1201, 1024, 768)

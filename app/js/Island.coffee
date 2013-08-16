((root, targetNS, localName, imageId, screenWidth, screenHeight) ->

  root[targetNS] = root[targetNS] || {}

  # This Bitmap class essentially contains the raw image.
  IslandBitmap = () ->
    @initialize(root[targetNS].images[imageId])
    return

  # The following constants should be set to match the properties of the island.png
  IMAGE_WIDTH_PIXELS = 1523
  IMAGE_HEIGHT_PIXELS = 1219

  IslandBitmap.prototype = new createjs.Bitmap()
  IslandBitmap.prototype.nominalBounds = new createjs.Rectangle(0, 0, IMAGE_WIDTH_PIXELS, IMAGE_HEIGHT_PIXELS)

  # The scale factors required to size the image to the screen.
  SCALE_X = screenWidth / IMAGE_WIDTH_PIXELS
  SCALE_Y = screenHeight / IMAGE_HEIGHT_PIXELS

  # This Container scales the bitmap to the screen resolution.
  IslandContainer = () ->
    @initialize()
    bitmap = new IslandBitmap();
    bitmap.setTransform(0, 0, SCALE_X, SCALE_Y)
    @addChild(bitmap)
    return

  IslandContainer.prototype = new createjs.Container()
  IslandContainer.prototype.nominalBounds = new createjs.Rectangle(0, 0, screenWidth, screenHeight)

  # This is the constructor entry point for the Island.
  root[targetNS][localName] = () ->
    @initialize()
    container = new IslandContainer()
    container.setTransform(0, 0, 1, 1, 0, 0, 0, 0, 0)
    @addChild(container)
    return

  root[targetNS][localName].prototype = new createjs.Container()
  root[targetNS][localName].prototype.nominalBounds = new createjs.Rectangle(0, 0, screenWidth, screenHeight)
  return

)(this, "SavvyParrot", "Island", 'img-island', 1024, 768)

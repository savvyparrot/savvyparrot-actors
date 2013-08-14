((root, targetNS, localName) ->

  root[targetNS] = root[targetNS] || {}

  IslandBitmap = () ->
    @initialize(root[targetNS].images['img-island'])
    return

  IslandBitmap.prototype = new createjs.Bitmap()
  IslandBitmap.prototype.nominalBounds = new createjs.Rectangle(0, 0, 1523, 1219)

  IslandContainer = () ->
    @initialize()
    bitmap = new IslandBitmap();
    bitmap.setTransform(-538.9, -384.9, 0.672, 0.63)
    @addChild(bitmap)
    return

  IslandContainer.prototype = new createjs.Container()
  IslandContainer.prototype.nominalBounds = new createjs.Rectangle(-538.9, -384.9, 1024, 768)

  root[targetNS][localName] = () ->
    @initialize()
    container = new IslandContainer()
    container.setTransform(1051, 769, 1, 1, 0, 0, 0, 512, 384)
    @addChild(container)
    return

  root[targetNS][localName].prototype = new createjs.Container()
  root[targetNS][localName].prototype.nominalBounds = new createjs.Rectangle(0, 0, 1024, 768)
  return

)(this, "SavvyParrot", "Island")

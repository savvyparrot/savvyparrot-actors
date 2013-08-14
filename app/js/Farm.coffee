((root, targetNS, localName) ->

  root[targetNS] = root[targetNS] || {}

  FarmhouseBitmap = () ->
    @initialize(root[targetNS].images['img-farmhouse'])
    return

  FarmhouseBitmap.prototype = new createjs.Bitmap()
  FarmhouseBitmap.prototype.nominalBounds = new createjs.Rectangle(0, 0, 1500, 1201)

  root[targetNS][localName] = () ->
    @initialize()
    bitmap = new FarmhouseBitmap()
    bitmap.setTransform(-511.9, -383.9, 0.683, 0.639)
    @addChild(bitmap)
    return

  root[targetNS][localName].prototype = new createjs.Container()
  root[targetNS][localName].prototype.nominalBounds = new createjs.Rectangle(-511.9, -383.9, 1024, 768)
  return

)(this, "SavvyParrot", "Farm")

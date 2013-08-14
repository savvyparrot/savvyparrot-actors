((root, targetNS, localName) ->

  root[targetNS] = root[targetNS] || {}

  root[targetNS][localName] = (arg0, arg1, words, backgroundColor) ->
    @initialize(arg0, arg1)

    text = new createjs.Text(words, "bold 36px Comic Sans MS")
    text.lineHeight = 38
    text.lineWidth = 393
    text.setTransform(12, 0)

    shape = new createjs.Shape();
    shape.graphics.f(backgroundColor).s().p("EglFgNzMBDnAISIGkQ2MhFWACfg")
    shape.setTransform(206.6, 50.5)

    @addChild(shape, text)
    return

  root[targetNS][localName].prototype = new createjs.Container()
  root[targetNS][localName].prototype.nominalBounds = new createjs.Rectangle(-30.8, -37.9, 474.9, 177)
  return

)(this, "SavvyParrot", "Bubble")

((scope)->
  'use strict'

  class StageManager
    constructor: (@stage) ->

    resizeStage: () ->
      gameArea = document.getElementById('gameArea')
      # Original stage width and height
      ow = 1024
      oh = 768
      widthToHeight = 4 / 3
      # Browser viewport size.
      w = window.innerWidth
      h = window.innerHeight
      newWidthToHeight = w / h

      # Maintain the aspect ratio
      if newWidthToHeight > widthToHeight
        w = h * widthToHeight
        gameArea.style.height = h + 'px'
        gameArea.style.width = w + 'px'
      else
        h = w / widthToHeight
        gameArea.style.width = w + 'px'
        gameArea.style.height = h + 'px'

      # Center the game area in the window.
      # Recall that the CSS is already placing the top-left corner of the
      # gameArea div at the exact center of the window.
      gameArea.style.marginTop = (-h / 2) + 'px'
      gameArea.style.marginLeft = (-w / 2) + 'px'

      # Automatically adjust font size?
      gameArea.style.fontSize = (w /400) + 'em'
      
      gameCanvas = document.getElementById('gameCanvas')
      gameCanvas.width = w
      gameCanvas.height = h

      scale = Math.min(w / ow, h / oh)
      @stage.scaleX = scale
      @stage.scaleY = scale
      @stage.update()
      return

  if typeof scope is "object" and scope.document and typeof scope.document is "object"

    scope.SavvyParrot = scope.SavvyParrot or {}
    scope.SavvyParrot.StageManager = StageManager

  return
)((if (typeof window is 'object') then window else (if (typeof module is 'object') then module else undefined)))
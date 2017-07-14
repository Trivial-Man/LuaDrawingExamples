  -- These settings initialize the canvas
  local newWindow = forms.newform(1000,1000, "Drawing Tests")
  local newPictureBox = forms.pictureBox(newWindow, 50, 50, 900, 900)
  forms.setlocation(newWindow, 0, 0)

  -- This clears any drawings that may have been done before it was called.
  -- It also sets the background color of the window.
  -- If you are using a script that updates the display, make sure to call
  -- this after the Refresh and before redrawing all your information
  forms.clear(newPictureBox, "White")
    
  -- This sets the background color of any relevant functions.
  -- Unless another color is specified in the function call,
  -- the background will be drawn with this color
  forms.setDefaultBackgroundColor(newPictureBox, "Yellow")
  
  -- DrawBezier is called with a table of points.
  -- Points consist of 2 integer values, and there must
  -- be at least 2 points in the DrawBezier call
  forms.drawBezier(newPictureBox, {{10, 30},{20, 10},{40, 30},{60, 40}}, "Red")
  
  forms.drawBox(newPictureBox, 100, 100, 200, 222, "Blue")
  forms.drawLine(newPictureBox, 420, 420, 88, 30, "Pink")
  forms.drawAxis(newPictureBox, 555, 555, 44, "Black")
  
  -- Setting the default foreground or background color to null
  -- sets it to transparency.
  -- Transparency is the default for the background
  forms.setDefaultBackgroundColor(newPictureBox, null)
  forms.setDefaultForegroundColor(newPictureBox, "Orange")
  
  -- Drawing Pies is very complicated. The first 2 numbers are x and y position,
  -- the next 2 are width and height.
  -- The penultimate number (90 in this case) is the angle the drawing should
  -- start at measured in degrees clockwise from the rightmost edge of the
  -- circle. This means 90 is the bottom, 180 is the leftmost edge, and 270 is
  -- the top. Values greater than 360 are allowed, and correlated to rounding
  -- the circle multiple times.
  -- The final value is how many degrees from the starting angle should be drawn.
  -- For example setting it to 90 would draw a quarter circle. This is also
  -- meausured in the clockwise direction and can also go above 360.
  forms.drawPie(newPictureBox, 666, 696, 30, 80, 90, 245)
  
  forms.drawPixel(newPictureBox, 80, 400, "Black")
  forms.drawText(newPictureBox, 100, 500, "Wowie! Look at all these drawings!", "Purple")
  
  -- Like DrawBezier, DrawPolygon is called with a table of points.
  -- Each point represents a vertex of the polygon, and lines are
  -- drawn between adjacent vertices.
  -- The last point listed is automatically connected to the first
  -- to close the polygon without the need to duplicate any points
  -- in the table.
  forms.drawPolygon(newPictureBox, {{110, 630},{120, 610},{140, 630},{160, 640}})
  
  forms.drawEllipse(newPictureBox, 300, 300, 77, 69, "Green", "Brown")
  
  -- By default, the foreground is white. Setting this to null would make
  -- the primary thing you are drawing become invisible.
  forms.setDefaultForegroundColor(newPictureBox, null)
  -- For example, this ellipse should completely cover up the previous one,
  -- but since the default foreground and background are transparent
  -- this call is equivalent to drawing nothing.
  forms.drawEllipse(newPictureBox, 300, 300, 77, 69)
  
  -- At present, if the files specified here are not found, they will
  -- simply not be drawn. No error is printed and the script is not
  -- terminated. This is not the desired behavior, but when I copied
  -- them I didn't know how to fix it.
  forms.drawImage(newPictureBox, "kitchensink.png", 600, 10)
  forms.drawIcon(newPictureBox, "logo.ico", 300, 600)
  
  -- DrawImageRegion must take in a file name and at least 6 more numbers.
  -- The first 2 numbers are how many pixels from the left and top edges
  -- of the image should be cropped off. These numbers can be greater
  -- than the width and height of the image, in which case nothing
  -- will be drawn.
  -- The next 2 numbers are how many more pixels of the should be drawn
  -- from the points specified before. For example, this script cuts off
  -- the leftmost column of pixels and the topmost row of pixels and
  -- then from that point draws 10 more rows and columns of pixels
  -- below and to the right of that.
  -- The last 2 numbers are the coordinates that the image region
  -- should be drawn to.
  forms.drawImageRegion(newPictureBox, "kitchensink.png", 1, 1, 10, 10, 500, 800)
  
  local timesClicked = 0
  forms.drawText(newPictureBox, 50, 700, "Times clicked: "..timesClicked, "Black")
  
  local function clickMe()
    timesClicked = timesClicked + 1
    forms.clear(newPictureBox, "White")
    forms.drawText(newPictureBox, 50, 700, "Times clicked: "..timesClicked, "Black")
    forms.refresh(newPictureBox)
  end
  
  --forms.button(newWindow, "Click", clickMe, 0, 200)
  --local newLabel = forms.label(newWindow, "Click", 0, 0)
  forms.addclick(newPictureBox, clickMe)
  
  forms.refresh(newPictureBox)
  
  emu.yield()
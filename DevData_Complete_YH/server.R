library(png)
library(spatstat)
library(shiny)

shinyServer(function(input, output) {
  
  # image1 creates a new PNG file each time Radius changes
  output$image_output <- renderImage({

    # Set width and height of image_output
    width<-300
    height<-300
    
    # A temp file to save the output.
    # This file will be automatically removed later by
    # renderImage, because of the deleteFile=TRUE argument.
    outfile <- tempfile(fileext = ".png")
    
    # Generate the image with slider input sigma
    pic <- matrix(rnorm(width*height,mean=0.5,sd=input$sigma),height,width)
    
    # blur it with gaussian kernel using spatstat blur
    pic <- as.matrix(blur(as.im(pic),sigma=input$filterWidth))
    
    # write png
    writePNG(pic, target = outfile)
    
    # Return a list containing information about the image
    list(src = outfile,
         contentType = "image/png",
         width = width,
         height = height,
         alt = "This is alternate text")
    
  }, deleteFile = TRUE)
  
})

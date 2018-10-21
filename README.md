# LowPolyHack

Steps to get Low Poly style

- Reduce noise:
    Why: Noise will affect edge detection. Since we are reducing the precision and the level of details in the image, we want the edge lines to be as clean and simple as possible.
    Averaging: Good for removing grain noise (bad)
    Gaussian filters
- Edge detection
    Why: Delaunay Triangulation genrates vertices randomly, which is the problem of a lot of current applications. We want to constrain the the range of pixels within edge pixels to reserve the shape of objects.
    Sobel (worse than Canny)
    Canny
    Prewitt
    Roberts
    log
    zerocross (explore)
- Delaunay triangulation
    Implement the method when have time 
- Colorize
    mean value?
- Improve the result
    
# LowPolyHack

## Getting Started
Transfer image into low poly

### Prerequisites

URL of the website


## Steps to get Low Poly style

### Reduce noise:
    Why: Noise will affect edge detection. Since we are reducing the precision and the level of details in the image, we want the edge lines to be as clean and simple as possible.
```
    Averaging: Good for removing grain noise (bad)
    Gaussian filters
```
### Edge detection
    Why: Delaunay Triangulation genrates vertices randomly, which is the problem of a lot of current applications. We want to constrain the the range of pixels within edge pixels to reserve the shape of objects.
```
    Sobel (worse than Canny)
    Canny
    Prewitt
    Roberts
    log
    zerocross (explore)
```
### Image Segmentation
    A potential auxiliary or alternative towards edge detection
### Delaunay triangulation
    Implement the method when have time 
### Colorize
    mean value?
### Improve the result

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Yuke Liang** - *Initial work* - [LowPolyHack](URL)
* **Yudong Huang** - *Initial work* - [LowPolyHack](URL)
* **Zhaoning Wang** - *Initial work* - [LowPolyHack](URL)

## License
 not yet

## Acknowledgments

* Tip to use
* Inspiration:
* etc


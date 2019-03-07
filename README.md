### MatrixDS
The [MatrixDS](http://matrixds.com) community platform is a data science workbench that runs on a kubernetes engine. MatrixDS projects are a network directory containing files, code, data, and dependencies. The project directory is mounted, as a file system, onto different environments (tools). The workbench manages all of the container deoployment considerations through the web interface. 

## MatrixDS Public Tools
Contained in this repository is the set of docker files and related configurations for [MatrixDS](http://matrixds.com) compatible tool containers. 

The goal of providing this set of tool containers from which the data science community can use as a base to build your own. While our base images have quite a robust offereing users may have unique dependieces that require building their own image. Some of these applications may include:

* Teaching a data science or machine learning course
* Giving a MOOC or tutorial
* Custom Enviroments for a specific project

When building your own image use this tree to guide your decision. All munge/modeling images are build off a base images called **Agent Smith (asmith)**.

![](/img/tree.png)

The subdirectories in this repo contain all the files necessary for an automated build on docker hub. The MatrixDS docker hub site with official images can [be found here.](https://hub.docker.com/u/matrixds/dashboard/). Once you have an image built push it to Docker Hub and then you can deploy it directly on MatrixDS

## Deploying Tools
Using any docker hub container creates quite a bit of flexibility for adding cutting-edge tools to your analytics project. Each tool has a hostname in the detail panel for connectivity purposes. A word of caution is to pay close attention to where you put the mount path for each tool as that is where you will be able to access MatrixDS project files. The defalut mount paths for munge/model and present tools are:

* Jupyter Lab Mount Path: `/home/matrix`
* RStudio Mount Path: `/home/rstudio`
* Shiny: `/srv`
* Bokeh: `/app`

Here is how you build a custom tool on MatrixDS:  

![](/img/customTool.gif)

# Run on top of java 7
FROM dockerfile/java:openjdk-7-jdk
MAINTAINER Tobias Wiens <tobwiens@gmail.com>

# Install R
RUN ["/bin/bash", "-c", "sudo apt-get update && \
sudo apt-get install r-base \
-y"]

#RUN ["/bin/bash", "-c", "R CMD javareconf"]

RUN ["/bin/bash", "-c", "sudo apt-get install r-cran-rjava -y"]

# Install mysql dev and mesa commond dev (GL/gl.h) for R packages
RUN ["/bin/bash", "-c", "sudo apt-get install libmysqlclient-dev mesa-common-dev -y"]

# Install packages needed for proactive-tutorial
RUN ["/bin/bash", "-c", "echo \"install.packages(c('rJava','gtools', 'codetools', 'stringr'), repos='http://cran.univ-paris1.fr/',lib='/usr/local/lib/R/site-library', dependencies=TRUE) \" | sudo R --no-save"] 


# Install all packages important for executing the task
RUN ["/bin/bash", "-c", "echo \"install.packages(c('rgl','e1071','lubridate','xts','scatterplot3d','Metrics','caret','kernlab','nnet','quantmod'), repos='http://cran.univ-paris1.fr/',lib='/usr/local/lib/R/site-library', dependencies=TRUE)\" | sudo R --no-save"]

ENV R_HOME /usr/lib/R
WORKDIR /data/context
  

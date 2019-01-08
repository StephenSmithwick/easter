#! /bin/bash

export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=$(realpath $(brew --prefix gradle))/libexec
export GRADLE_USER_HOME=$GRADLE_HOME
export PATH=$GRADLE_HOME/bin:$MAVEN_HOME/bin:$PATH

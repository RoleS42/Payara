#!/bin/bash
  
# Read in properties file
. ./release-config.properties
 
###############################################################################
 
# Ensure we're using JDK8
export PATH="${JDK8_PATH}/bin:${PATH}:${JDK8_PATH}/bin"
export JAVA_HOME="${JDK8_PATH}"
 
# Remove the base pom if it's present to prevent error
rm pom.xml
 
mvn deploy:deploy-file -Dfile=Payara/payara-${VERSION}.zip -Dsources=Payara/payara-${VERSION}-sources.jar -Djavadoc=Payara/payara-${VERSION}-javadoc.jar -DpomFile=Payara/payara-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
mvn deploy:deploy-file -Dfile=Payara/payara-${VERSION}.tar.gz -DpomFile=Payara/payara-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dpackaging=tar.gz
    
mvn deploy:deploy-file -Dfile=Payara-ML/payara-ml-${VERSION}.zip -Dsources=Payara-ML/payara-ml-${VERSION}-sources.jar -Djavadoc=Payara-ML/payara-ml-${VERSION}-javadoc.jar -DpomFile=Payara-ML/payara-ml-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
mvn deploy:deploy-file -Dfile=Payara-ML/payara-ml-${VERSION}.tar.gz -DpomFile=Payara-ML/payara-ml-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dpackaging=tar.gz
    
mvn deploy:deploy-file -Dfile=Payara-Web/payara-web-${VERSION}.zip -Dsources=Payara-Web/payara-web-${VERSION}-sources.jar -Djavadoc=Payara-Web/payara-web-${VERSION}-javadoc.jar -DpomFile=Payara-Web/payara-web-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
mvn deploy:deploy-file -Dfile=Payara-Web/payara-web-${VERSION}.tar.gz -DpomFile=Payara-Web/payara-web-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dpackaging=tar.gz
    
mvn deploy:deploy-file -Dfile=Payara-Web-ML/payara-web-ml-${VERSION}.zip -Dsources=Payara-Web-ML/payara-web-ml-${VERSION}-sources.jar -Djavadoc=Payara-Web-ML/payara-web-ml-${VERSION}-javadoc.jar -DpomFile=Payara-Web-ML/payara-web-ml-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
mvn deploy:deploy-file -Dfile=Payara-Web-ML/payara-web-ml-${VERSION}.tar.gz -DpomFile=Payara-Web-ML/payara-web-ml-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dpackaging=tar.gz
   
mvn deploy:deploy-file -Dfile=Payara-Micro/payara-micro-${VERSION}.jar -Dsources=Payara-Micro/payara-micro-${VERSION}-sources.jar -Djavadoc=Payara-Micro/payara-micro-${VERSION}-javadoc.jar -DpomFile=Payara-Micro/payara-micro-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
   
mvn deploy:deploy-file -Dfile=Payara-Embedded-All/payara-embedded-all-${VERSION}.jar -Dsources=Payara-Embedded-All/payara-embedded-all-${VERSION}-sources.jar -Djavadoc=Payara-Embedded-All/payara-embedded-all-${VERSION}-javadoc.jar -DpomFile=Payara-Embedded-All/payara-embedded-all-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
   
mvn deploy:deploy-file -Dfile=Payara-Embedded-Web/payara-embedded-web-${VERSION}.jar -Dsources=Payara-Embedded-Web/payara-embedded-web-${VERSION}-sources.jar -Djavadoc=Payara-Embedded-Web/payara-embedded-web-${VERSION}-javadoc.jar -DpomFile=Payara-Embedded-Web/payara-embedded-web-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
   
mvn deploy:deploy-file -DgroupId=fish.payara.extras -DartifactId=payara-source -Dversion=${VERSION} -Dpackaging=zip -Dfile=SourceExport/payara-source-${VERSION}.zip -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore
  
mvn deploy:deploy-file -Dversion=${VERSION} -Dfile=Payara-API/payara-api-${VERSION}.jar -DpomFile=Payara-API/payara-api-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dsources=Payara-API/payara-api-${VERSION}-sources.jar -Djavadoc=Payara-API/payara-api-${VERSION}-javadoc.jar

mvn deploy:deploy-file -Dversion=${VERSION} -Dfile=Payara-EJB-HTTP-Client/ejb-http-client-${VERSION}.jar -DpomFile=Payara-EJB-HTTP-Client/ejb-http-client-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dsources=Payara-EJB-HTTP-Client/ejb-http-client-${VERSION}-sources.jar -Djavadoc=Payara-EJB-HTTP-Client/ejb-http-client-${VERSION}-javadoc.jar

mvn deploy:deploy-file -Dversion=${VERSION} -Dfile=Payara-Appclient/payara-client-${VERSION}.jar -DpomFile=Payara-Appclient/payara-client-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore -Dsources=Payara-Appclient/payara-client-${VERSION}-sources.jar -Djavadoc=Payara-Appclient/payara-client-${VERSION}-javadoc.jar

mvn deploy:deploy-file -Dversion=${VERSION} -DpomFile=Payara-BOM/payara-bom-${VERSION}.pom -Dfile=Payara-BOM/payara-bom-${VERSION}.pom -DrepositoryId=payara-nexus -Durl=https://nexus.payara.fish/content/repositories/payara-patches/ -Djavax.net.ssl.trustStore=/tmp/mavenKeystore

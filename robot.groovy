import jenkins.model.Jenkins
import java.util.logging.LogManager
/* Jenkins home directory */ 
def jenkinsHome = Jenkins.instance.getRootDir().absolutePath
def logger = LogManager.getLogManager().getLogger("")
/* Replace the Key and value with the values you want to set.*/
/* System.setProperty(key, value) */
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
logger.info("Jenkins Startup Script: Successfully updated the system properties value for hudson.model.DirectoryBrowserSupport.CSP . Script location : ${jenkinsHome}/init.groovy.d ")

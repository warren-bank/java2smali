@echo off

rem :: in Java 11+, this option will prevent: "WARNING: An illegal reflective access operation has occurred"
rem :: https://learn.microsoft.com/en-us/java/openjdk/transition-from-java-8-to-java-11#warning-an-illegal-reflective-access-operation-has-occurred
set "JAVA_OPTS=--add-opens=java.base/java.lang.reflect=ALL-UNNAMED"

call java %JAVA_OPTS% -classpath "%~dp0.\2-dst" "Main"

echo.
pause

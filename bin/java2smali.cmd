@echo off

set src_dir_path=%~1
set dst_dir_path=%~2
set rel_fil_path=%~3

if not defined src_dir_path goto :usage

if not defined dst_dir_path goto :usage

if not defined rel_fil_path (
  set rel_fil_path=%dst_dir_path%
  set dst_dir_path=%src_dir_path%
)

if not exist "%dst_dir_path%" mkdir "%dst_dir_path%"
cd /D "%dst_dir_path%"

call javac -sourcepath "%src_dir_path%" -d "%dst_dir_path%" -g:none "%src_dir_path%\%rel_fil_path%.java"

call java -jar "%~dp0..\tools\dx.jar" --dex --output "%rel_fil_path%.dex" "%rel_fil_path%.class"

call java -jar "%~dp0..\tools\baksmali.jar" disassemble -o "." "%rel_fil_path%.dex"

goto :done

:usage
  echo usage: java2smali [src_dir_path] [dst_dir_path] [rel_file_path]

:done

@echo off
REM Pueden omitir la linea anterior si desean saber que "ejecuta"

REM El script se puede mejorar, pero para nuestros fines servira....
REM Traten de colocarlo y usarlo dentro del directorio en donde esten
REM sus archivos VHDL que desean simular.
REM El scrip esta preparado para simular la ENTIDAD y su respectiva
REM ENTIDAD_tb

REM Directorio en donde colocaron GHDL 
SET DIR_GHDL="C:\GHDL\bin\ghdl.exe"
REM Directorio en donde colocaron GTKWave
SET DIR_GTKWAVE="C:\gtkwave64\bin\gtkwave.exe"
REM La extension de sus archivos, en este caso uso "vhd"
SET EXT_VHDL="vhd"

REM Analiza los archivos
@REM %DIR_GHDL% -a %1.%EXT_VHDL%
ghdl.exe -a %1_tb.%EXT_VHDL%

REM Crea el "ejecutable"...
ghdl.exe -e %1_tb

REM Simula "Ejecuta"...
ghdl.exe -r %1_tb --vcd=%1.vcd

REM Muestra los resultados de la smulacion en GTKWave.
gtkwave.exe --rcvar "do_initial_zoom_fit yes" %1.vcd 

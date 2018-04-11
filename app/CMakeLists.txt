cmake_minimum_required(VERSION 2.8.11)

set (APP_VERSION 1)
set (APP_RELEASE 0)

set( SRC main.cpp MainWindow.cpp)
set( LIB lib)
set( FORM mainwindow.ui dlg.ui)


build_exe(app SOURCES ${SRC} LIBS ${LIB} FORMS ${FORM} )


qt5_copy_dlls(app "Core;Widgets;Gui;WebSockets")

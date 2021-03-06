#--------------------------------------------
#
# Pro file for Windows builds with Qt Creator
#
#--------------------------------------------

TEMPLATE = lib
CONFIG += plugin

QT += core gui widgets multimedia opengl

TARGET = outputbladerf1

DEFINES += USE_SSE2=1
QMAKE_CXXFLAGS += -msse2
DEFINES += USE_SSE4_1=1
QMAKE_CXXFLAGS += -msse4.1
QMAKE_CXXFLAGS += -std=c++11

CONFIG(MINGW32):LIBBLADERF = "C:\Programs\bladeRF"
CONFIG(MINGW64):LIBBLADERF = "C:\Programs\bladeRF"
INCLUDEPATH += $$PWD
INCLUDEPATH += ../../../exports
INCLUDEPATH += ../../../sdrbase
INCLUDEPATH += ../../../sdrgui
INCLUDEPATH += ../../../swagger/sdrangel/code/qt5/client
INCLUDEPATH += ../../../devices

MINGW32 || MINGW64 {
    LIBBLADERF = "C:\Programs\bladeRF"
    INCLUDEPATH += $$LIBBLADERF/include
}

MSVC {
    INCLUDEPATH += "C:\Program Files\PothosSDR\include"
}

CONFIG(Release):build_subdir = release
CONFIG(Debug):build_subdir = debug

SOURCES += bladerf1outputgui.cpp\
    bladerf1output.cpp\
    bladerf1outputplugin.cpp\
    bladerf1outputsettings.cpp\
    bladerf1outputthread.cpp

HEADERS += bladerf1outputgui.h\
    bladerf1output.h\
    bladerf1outputplugin.h\
    bladerf1outputsettings.h\
    bladerf1outputthread.h

FORMS += bladerf1outputgui.ui

LIBS += -L../../../sdrbase/$${build_subdir} -lsdrbase
LIBS += -L../../../sdrgui/$${build_subdir} -lsdrgui
LIBS += -L../../../swagger/$${build_subdir} -lswagger
LIBS += -L../../../devices/$${build_subdir} -ldevices

MINGW32 || MINGW64 {
    LIBS += -L$$LIBBLADERF/lib -lbladeRF
}

MSVC {
    LIBS += -L"C:\Program Files\PothosSDR\lib" -L"C:\Program Files\PothosSDR\bin" -lbladeRF
}

RESOURCES = ../../../sdrgui/resources/res.qrc

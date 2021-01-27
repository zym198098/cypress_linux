TEMPLATE	= app

HEADERS		= ../include/controlcenter.h
FORMS		= controlcenter.ui
SOURCES		= controlcenter.cpp main.cpp fx2_download.cpp fx3_download.cpp streamer.cpp
LIBS		+= -L../lib -lcyusb  -lusb-1.0
QT              += widgets
QT              += network
#TARGET		= ../bin/cyusb_linux

CONFIG +=debug_and_release
CONFIG(debug,debug|release){
    TARGET= cyusb_linux
    DESTDIR= ../bin/debug
}
else{
    TARGET= cyusb_linux
    DESTDIR= ../bin/release
}
#QMAKE_LFLAGS += -no-pie

#unix|win32: LIBS += -lusb-1.0

#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../lib/release/ -lcyusb
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../lib/debug/ -lcyusb
#else:unix: LIBS += -L$$PWD/../lib/ -lcyusb

#INCLUDEPATH += $$PWD/../include
#DEPENDPATH += $$PWD/../include

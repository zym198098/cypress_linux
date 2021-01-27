cmake_minimum_required(VERSION 3.8)
project(cyusb_linux)
set(CMAKE_CXX_FLAGS "-pipe")
set(CMAKE_CXX_FLAGS "-O2")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

#打开全局moc
set(CMAKE_AUTOMOC ON)
#打开全局uic
set(CMAKE_AUTOUIC ON)
#打开全局rcc，本示例中没有使用qrc，此句可以去掉
set(CMAKE_AUTORCC ON)
include_directories(./gui_src)
include_directories(./include)
#message(${PROTOBUF_INCLUDE_DIRS})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
aux_source_directory(./gui_src  DIR_SRCS)
message(${DIR_SRCS} "source -dir")
#设置qt 库的环境变量
#set (CMAKE_PREFIX_PATH  $ENV{QTDIR}/lib/cmake/Qt5)
set (CMAKE_PREFIX_PATH  home/Qt5.9.7/5.9.7/gcc_64/lib/cmake)

message(${CMAKE_PREFIX_PATH} ";qtdir")



message(${CMAKE_PREFIX_PATH}   "->cmake path")
find_package(Qt5 COMPONENTS Widgets Core Gui REQUIRED )
find_package(Qt5 COMPONENTS Network REQUIRED )
set( exe_name ${PROJECT_NAME})
message(${exe_name} "  ->exename")
add_compile_options(-g)

#add liusb 
#//头文件目录
include_directories(/usr/local/include/libusb-1.0)

#添加静态库目录
LINK_DIRECTORIES(/usr/local/lib)

#add cypress usb lib
include_directories(/usr/include)
LINK_DIRECTORIES(/usr/lib/x86_64-linux-gnu)
LINK_DIRECTORIES(./lib)

 #cmake FLAGE
add_executable(cyusb_linux  ${DIR_SRCS})
  
 # Use the Widgets module from Qt 5  
 qt5_use_modules(cyusb_linux Widgets )  
 
 
 target_link_libraries(cyusb_linux libcyusb.so )
 target_link_libraries(cyusb_linux libpthread.so)
 target_link_libraries(cyusb_linux libusb-1.0.a )
 target_link_libraries(cyusb_linux  Qt5::Core Qt5::Gui Qt5::Network Qt5::Widgets)
#message(${DIR_SRCS}  "source dir"）
#target_link_libraries(QtCmake Qt5::Widgets)
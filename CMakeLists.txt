cmake_minimum_required(VERSION 2.8.11)

set(CMAKE_CXX_FLAGS "-std=c++11")

add_definitions(-DUNICODE -D_UNICODE)

if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
  set (CMAKE_PREFIX_PATH "C:/Qt/Qt5.10.0/5.10.0/msvc2017_64")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
endif()


set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt5Widgets)
find_package(Qt5Core)
find_package(Qt5Gui)
find_package(Qt5WebSockets)


include (Utils.cmake)
if (CMAKE_BUILD_TYPE EQUAL "DEBUG")
  message("1" ${Qt5_CoreLocation})
  get_target_property(Qt5_CoreLocation Qt5::Core LOCATION_DEBUG)
else()
  message("2" ${Qt5_CoreLocation})
  get_target_property(Qt5_CoreLocation Qt5::Core LOCATION)
endif()


add_subdirectory(lib)
add_subdirectory(app)

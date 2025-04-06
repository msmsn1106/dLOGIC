cmake_minimum_required(VERSION 3.10)

project(dLOGIC_ULS)

set(CMAKE_CXX_STANDARD 11)

# Qtの自動処理を有効化
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Qt5ライブラリを探す
find_package(Qt5 COMPONENTS Widgets REQUIRED)

include_directories(include)

file(GLOB SOURCES "src/*.cpp" "src/utils/*.cpp")

# 実行ファイルを作成
add_executable(dLOGIC_ULS ${SOURCES})
target_link_libraries(dLOGIC_ULS Qt5::Widgets)
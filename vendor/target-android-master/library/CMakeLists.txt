# Standard setup
cmake_minimum_required(VERSION 3.6)

set(EZORED_PROJECT_CONFIG_NAME "EzoRed")
set(EZORED_PROJECT_CONFIG_CPP_STANDARD "11")

project(${EZORED_PROJECT_CONFIG_NAME})

# Header search paths
set(EZORED_HEADER_SEARCH_PATHS
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/java"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/shared"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/java"
)

include_directories(${EZORED_HEADER_SEARCH_PATHS})

# Library search paths
set(EZORED_LIBRARY_SEARCH_PATHS
)

link_directories(${EZORED_LIBRARY_SEARCH_PATHS})

# Source groups
source_group("ezored-dependency-djinni-support" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_main.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_support.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_support.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/Marshal.hpp"
)
source_group("ezored-dependency-sample" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessageBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessagePlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessageBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessagePlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
)
source_group("ezored-dependency-media-audio-streamer" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerPlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
)
source_group("ezored-dependency-http-httpclient" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientPlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpResponse.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpResponse.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Source files
set(EZORED_SOURCE_FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_main.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_support.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_support.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/Marshal.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessageBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessagePlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessageBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessagePlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerPlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientBridge.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientPlatformService.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpResponse.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpResponse.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Header files
set(EZORED_HEADER_FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/djinni_support.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/jni/Marshal.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessageBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/jni-output/GreetingMessagePlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/jni-output/AudioStreamerPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientBridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpClientPlatformService.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/jni-output/HttpResponse.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Library links
set(EZORED_LIBRARY_LINKS
)

string(STRIP "${EZORED_LIBRARY_LINKS}" EZORED_LIBRARY_LINKS)

# CFlags
set(EZORED_CMAKE_C_FLAGS "-Wall ")

string(STRIP "${EZORED_CMAKE_C_FLAGS}" EZORED_CMAKE_C_FLAGS)

# CXXFlags
set(EZORED_CMAKE_CXX_FLAGS "-std=c++${EZORED_PROJECT_CONFIG_CPP_STANDARD} -frtti -fexceptions -Wall ")

string(STRIP "${EZORED_CMAKE_CXX_FLAGS}" EZORED_CMAKE_CXX_FLAGS)

# Compile options
set(EZORED_COMPILE_OPTIONS "")

string(STRIP "${EZORED_COMPILE_OPTIONS}" EZORED_COMPILE_OPTIONS)

# Library
add_library(${EZORED_PROJECT_CONFIG_NAME} SHARED ${EZORED_SOURCE_FILES})

# Target links
target_link_libraries(${EZORED_PROJECT_CONFIG_NAME} "${EZORED_LIBRARY_LINKS}")

# Flags
set(CMAKE_C_FLAGS "${EZORED_CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${EZORED_CMAKE_CXX_FLAGS}")

target_compile_options(${EZORED_PROJECT_CONFIG_NAME} PUBLIC "${EZORED_COMPILE_OPTIONS}")
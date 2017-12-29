# Standard setup
cmake_minimum_required(VERSION 3.9)

set(EZORED_PROJECT_CONFIG_NAME "EzoRed")
set(EZORED_PROJECT_CONFIG_DEVELOPMENT_TEAM_ID "54BDV6YZ73")
set(EZORED_PROJECT_CONFIG_FRAMEWORK_BUNDLE_IDENTIFIER "com.ezored.sampleapp.framework")
set(EZORED_PROJECT_CONFIG_CODE_SIGN_IDENTITY "iPhone Developer")
set(EZORED_PROJECT_CONFIG_DEPLOYMENT_TARGET "8.0")
set(EZORED_PROJECT_CONFIG_DEVICE_FAMILY "1,2")
set(EZORED_PROJECT_CONFIG_VERSION "1.0.0")
set(EZORED_PROJECT_CONFIG_CPP_STANDARD "11")

set(DEVELOPMENT_PROJECT_NAME "${EZORED_PROJECT_CONFIG_NAME}") # <== Set to your project name, e.g. project.xcodeproj
set(DEVELOPMENT_TEAM_ID "${EZORED_PROJECT_CONFIG_DEVELOPMENT_TEAM_ID}") # <== Set to your team ID from Apple
set(FRAMEWORK_NAME "${EZORED_PROJECT_CONFIG_NAME}") # <== Set to your framework's name
set(FRAMEWORK_BUNDLE_IDENTIFIER "${EZORED_PROJECT_CONFIG_FRAMEWORK_BUNDLE_IDENTIFIER}") # <== Set to your framework's bundle ID
set(CODE_SIGN_IDENTITY "${EZORED_PROJECT_CONFIG_CODE_SIGN_IDENTITY}") # <== Set to your preferred code sign identity, to see list: /usr/bin/env xcrun security find-identity -v -p codesigning
set(DEPLOYMENT_TARGET "${EZORED_PROJECT_CONFIG_DEPLOYMENT_TARGET}") # <== Set your deployment target version of iOS
set(DEVICE_FAMILY "${EZORED_PROJECT_CONFIG_DEVICE_FAMILY}") # <== Set to "1" to target iPhone, set to "2" to target iPad, set to "1,2" to target both

set(VERSION "${EZORED_PROJECT_CONFIG_VERSION}")
set(SOVERSION "${EZORED_PROJECT_CONFIG_VERSION}")

project(${EZORED_PROJECT_CONFIG_NAME})

# Header search paths
set(EZORED_HEADER_SEARCH_PATHS
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/shared"
	"/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc"
)

include_directories(${EZORED_HEADER_SEARCH_PATHS})

# Library search paths
set(EZORED_LIBRARY_SEARCH_PATHS
)

link_directories(${EZORED_LIBRARY_SEARCH_PATHS})

# Source groups
source_group("ezored-dependency-djinni-support" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIError.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIProxyCaches.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJICppWrapperCache+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIError.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIMarshal+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIObjcWrapperCache+Private.h"
)
source_group("ezored-dependency-sample" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc/EZRGreetingMessagePlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc/EZRGreetingMessagePlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
)
source_group("ezored-dependency-media-audio-streamer" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc/EZRAudioStreamerPlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc/EZRAudioStreamerPlatformServiceImpl.h"
)
source_group("ezored-dependency-http-httpclient" FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc/EZRHttpClientPlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_response.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc/EZRHttpClientPlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Source files
set(EZORED_SOURCE_FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIError.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIProxyCaches.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJICppWrapperCache+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIError.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIMarshal+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIObjcWrapperCache+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc/EZRGreetingMessagePlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc/EZRGreetingMessagePlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc/EZRAudioStreamerPlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc/EZRAudioStreamerPlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse+Private.mm"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc/EZRHttpClientPlatformServiceImpl.m"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.cpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_response.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc/EZRHttpClientPlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Header files
set(EZORED_HEADER_FILES
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJICppWrapperCache+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIError.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIMarshal+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-djinni-support-master/support-lib/objc/DJIObjcWrapperCache+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/cpp-output/greeting_message_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessageBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/djinni/objc-output/EZRGreetingMessagePlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/objc/EZRGreetingMessagePlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/cpp/GreetingMessageBridgeImpl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-sample-master/source/shared/ezored/sample/GreetingMessage.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/cpp-output/audio_streamer_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/djinni/objc-output/EZRAudioStreamerPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/cpp/audio_streamer_bridge_impl.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-media-audio-streamer-master/source/objc/EZRAudioStreamerPlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_bridge.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_client_platform_service.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/cpp-output/http_response.hpp"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientBridge+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpClientPlatformService+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/djinni/objc-output/EZRHttpResponse+Private.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/objc/EZRHttpClientPlatformServiceImpl.h"
        "/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/dependency-http-httpclient-master/source/cpp/HttpClientBridgeImpl.hpp"
)

# Framework links
set(EZORED_FRAMEWORK_LINKS
	"-framework Foundation"
	"-framework UIKit"
	"-framework AVFoundation"
	"-framework UIKit"
	"-framework CoreFoundation"
)

string(STRIP "${EZORED_FRAMEWORK_LINKS}" EZORED_FRAMEWORK_LINKS)

# Library links
set(EZORED_LIBRARY_LINKS
)

string(STRIP "${EZORED_LIBRARY_LINKS}" EZORED_LIBRARY_LINKS)

# CFlags
set(EZORED_CMAKE_C_FLAGS "-fobjc-arc -Wall ")

string(STRIP "${EZORED_CMAKE_C_FLAGS}" EZORED_CMAKE_C_FLAGS)

# CXXFlags
set(EZORED_CMAKE_CXX_FLAGS "-fobjc-arc -std=c++${EZORED_PROJECT_CONFIG_CPP_STANDARD} -stdlib=libc++ -Wall ")

string(STRIP "${EZORED_CMAKE_CXX_FLAGS}" EZORED_CMAKE_CXX_FLAGS)

# Compile options
set(EZORED_COMPILE_OPTIONS "")

string(STRIP "${EZORED_COMPILE_OPTIONS}" EZORED_COMPILE_OPTIONS)

# Library
add_library(${EZORED_PROJECT_CONFIG_NAME} SHARED ${EZORED_SOURCE_FILES})

# Target links
target_link_libraries(${EZORED_PROJECT_CONFIG_NAME} "${EZORED_LIBRARY_LINKS}")
target_link_libraries(${EZORED_PROJECT_CONFIG_NAME} "${EZORED_FRAMEWORK_LINKS}")

# Flags
set(CMAKE_C_FLAGS "${EZORED_CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${EZORED_CMAKE_CXX_FLAGS}")

set_target_properties(${EZORED_PROJECT_CONFIG_NAME} PROPERTIES
    CXX_STANDARD "${EZORED_PROJECT_CONFIG_CPP_STANDARD}"
    CXX_STANDARD_REQUIRED true
    CXX_EXTENSIONS false
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER "${FRAMEWORK_BUNDLE_IDENTIFIER}"
    MACOSX_FRAMEWORK_BUNDLE_VERSION "${VERSION}"
    VERSION "${VERSION}"
    SOVERSION "${SOVERSION}"
    PUBLIC_HEADER "${EZORED_HEADER_FILES}"
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET "${DEPLOYMENT_TARGET}"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "${CODE_SIGN_IDENTITY}"
    XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "${DEVELOPMENT_TEAM_ID}"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "${DEVICE_FAMILY}"
    XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH NO
    XCODE_ATTRIBUTE_SKIP_INSTALL YES
    GCC_GENERATE_DEBUGGING_SYMBOLS YES
    XCODE_ATTRIBUTE_INSTALL_PATH "@loader_path/Frameworks"
)

target_compile_options(${EZORED_PROJECT_CONFIG_NAME} PUBLIC "${EZORED_COMPILE_OPTIONS}")
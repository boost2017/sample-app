# Standard setup
cmake_minimum_required(VERSION {%- if target.project_config.ios and target.project_config.ios.cmake_version %} {{ target.project_config.ios.cmake_version }} {%- else %} {{ "3.9" }} {%- endif -%})

set(EZORED_PROJECT_CONFIG_NAME "{%- if target.project_config.name -%} {{ target.project_config.name }} {%- else -%} {{ "EzoRed" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_DEVELOPMENT_TEAM_ID "{%- if target.project_config.ios and target.project_config.ios.development_team_id -%} {{ target.project_config.ios.development_team_id }} {%- else -%} {{ "ABCDEFGHIJ" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_FRAMEWORK_BUNDLE_IDENTIFIER "{%- if target.project_config.ios and target.project_config.ios.bundle_id -%} {{ target.project_config.ios.bundle_id }} {%- else -%} {{ "com.ezored.library" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_CODE_SIGN_IDENTITY "{%- if target.project_config.ios and target.project_config.ios.code_sign_identity -%} {{ target.project_config.ios.code_sign_identity }} {%- else -%} {{ "iPhone Developer" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_DEPLOYMENT_TARGET "{%- if target.project_config.ios and target.project_config.ios.deployment_target -%} {{ target.project_config.ios.deployment_target }} {%- else -%} {{ "8.0" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_DEVICE_FAMILY "{%- if target.project_config.ios and target.project_config.ios.device_family -%} {{ target.project_config.ios.device_family }} {%- else -%} {{ "1,2" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_VERSION "{%- if target.project_config.ios and target.project_config.ios.version -%} {{ target.project_config.ios.version }} {%- else -%} {{- "1.0.0" -}} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_CPP_STANDARD "{%- if target.project_config.ios and target.project_config.ios.cpp_standard -%} {{ target.project_config.ios.cpp_standard }} {%- else -%} {{- "11" -}} {%- endif -%}")

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
{%- for value in target.header_search_paths %}
	"{{ value }}"
{%- endfor %}
)

include_directories(${EZORED_HEADER_SEARCH_PATHS})

# Library search paths
set(EZORED_LIBRARY_SEARCH_PATHS
{%- for value in target.library_search_paths %}
	"{{ value }}"
{%- endfor %}
)

link_directories(${EZORED_LIBRARY_SEARCH_PATHS})

# Source groups
{%- for source_group in target.source_groups %}
source_group("{{ source_group.name }}" FILES 
    {%- for file in source_group.source_files %}
        "{{ file }}"
    {%- endfor %}

    {%- for file in source_group.header_files %}
        "{{ file }}"
    {%- endfor %}
)
{%- endfor %}

# Source files
set(EZORED_SOURCE_FILES
{%- for source_group in target.source_groups %}
    {%- for file in source_group.source_files %}
        "{{ file }}"
    {%- endfor %}

    {%- for file in source_group.header_files %}
        "{{ file }}"
    {%- endfor %}
{%- endfor %}
)

# Header files
set(EZORED_HEADER_FILES
{%- for source_group in target.source_groups %}
    {%- for file in source_group.header_files %}
        "{{ file }}"
    {%- endfor %}
{%- endfor %}
)

# Framework links
set(EZORED_FRAMEWORK_LINKS
{%- for value in target.framework_links %}
	"-framework {{ value }}"
{%- endfor %}
)

string(STRIP "${EZORED_FRAMEWORK_LINKS}" EZORED_FRAMEWORK_LINKS)

# Library links
set(EZORED_LIBRARY_LINKS
{%- for value in target.library_links %}
	"{{ value }}"
{%- endfor %}
)

string(STRIP "${EZORED_LIBRARY_LINKS}" EZORED_LIBRARY_LINKS)

# CFlags
set(EZORED_CMAKE_C_FLAGS "{%- for value in target.c_flags -%} {{ value }} {% endfor -%}")

string(STRIP "${EZORED_CMAKE_C_FLAGS}" EZORED_CMAKE_C_FLAGS)

# CXXFlags
set(EZORED_CMAKE_CXX_FLAGS "{%- for value in target.cxx_flags -%} {{ value }} {% endfor -%}")

string(STRIP "${EZORED_CMAKE_CXX_FLAGS}" EZORED_CMAKE_CXX_FLAGS)

# Compile options
set(EZORED_COMPILE_OPTIONS "{%- for value in target.compile_options -%} {{ value }} {% endfor -%}")

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
    MACOSX_FRAMEWORK_SHORT_VERSION_STRING "${VERSION}"
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
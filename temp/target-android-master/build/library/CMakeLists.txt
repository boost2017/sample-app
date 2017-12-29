# Standard setup
cmake_minimum_required(VERSION {%- if target.project_config.android and target.project_config.android.cmake_version %} {{ target.project_config.android.cmake_version }} {%- else %} {{ "3.6" }} {%- endif -%})

set(EZORED_PROJECT_CONFIG_NAME "{%- if target.project_config.name -%} {{ target.project_config.name }} {%- else -%} {{ "EzoRed" }} {%- endif -%}")
set(EZORED_PROJECT_CONFIG_CPP_STANDARD "{%- if target.project_config.android and target.project_config.android.cpp_standard -%} {{ target.project_config.android.cpp_standard }} {%- else -%} {{- "11" -}} {%- endif -%}")

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

# Flags
set(CMAKE_C_FLAGS "${EZORED_CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${EZORED_CMAKE_CXX_FLAGS}")

target_compile_options(${EZORED_PROJECT_CONFIG_NAME} PUBLIC "${EZORED_COMPILE_OPTIONS}")
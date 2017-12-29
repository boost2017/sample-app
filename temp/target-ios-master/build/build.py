import os
import shutil
from subprocess import check_call

# prepare
home_dir = os.getenv(key='EZORED_PROJECT_HOME')
current_dir = os.getcwd()
vendor_dir = os.getenv(key='EZORED_TARGET_VENDOR_DIR')
temp_dir = os.getenv(key='EZORED_TARGET_TEMP_DIR')
build_dir = os.getenv(key='EZORED_TARGET_BUILD_DIR')
cmake_dir = os.path.join(vendor_dir, 'build')

frameworks = []

frameworks.append({
    'name': 'iOS',
    'platform': 'OS',
    'configurations': ['Debug', 'Release'],
    'suffix': 'iphoneos'
})

frameworks.append({
    'name': 'iOS - Simulator',
    'platform': 'SIMULATOR',
    'configurations': ['Debug', 'Release'],
    'suffix': 'iphonesimulator'
})

frameworks.append({
    'name': 'Apple TV OS',
    'platform': 'TVOS',
    'configurations': ['Debug', 'Release'],
    'suffix': 'appletvos'
})

frameworks.append({
    'name': 'Apple TV OS - Simulator',
    'platform': 'SIMULATOR_TVOS',
    'configurations': ['Debug', 'Release'],
    'suffix': 'appletvsimulator'
})

# frameworks.append({
#     'name': 'Watch OS',
#     'platform': 'WATCHOS',
#     'configurations': ['Debug', 'Release'],
#     'suffix': 'watchos'
# })

# frameworks.append({
#     'name': 'Watch OS - Simulator',
#     'platform': 'SIMULATOR_WATCHOS',
#     'configurations': ['Debug', 'Release'],
#     'suffix': 'watchossimulator'
# })

# build
for framework in frameworks:
    try:
        shutil.rmtree(path=cmake_dir)    
    except:
        pass

    try:
        os.makedirs(cmake_dir)
    except:
        pass

    # generate Xcode project
    os.chdir(cmake_dir)

    print('Generating Xcode project...')

    check_call([
        'cmake',
        '-DCMAKE_TOOLCHAIN_FILE=../files/ios.cmake',
        '-DIOS_PLATFORM={0}'.format(framework['platform']),
        '-GXcode',
        '../'
    ])

    # build the framework
    for configuration in framework['configurations']:
        print('Generating framework for {0} / {1} / {2}...'.format(framework['name'], framework['suffix'], configuration))

        check_call([
            'cmake',
            '--build',
            '.',
            '--config',
            configuration
        ])

        print('Framework for {0} / {1} / {2} was generated'.format(framework['name'], framework['suffix'], configuration))

        # copy files
        framework_folder_name = '{0}-{1}'.format(configuration, framework['suffix'])

        try:
            os.makedirs(build_dir)
        except:
            pass

        try:
            shutil.rmtree(path=os.path.join(build_dir, framework_folder_name))
        except:
            pass
        
        shutil.copytree(os.path.join(cmake_dir, framework_folder_name), os.path.join(build_dir, framework_folder_name))

    os.chdir(current_dir)

# generate universal framework
print('Generating universal framework...')

uframeworks = []

uframeworks.append({
    'name': 'Debug',
    'frameworks': ['iphoneos', 'iphonesimulator'],
    'base_framework': 'iphoneos',
    'configuration': 'Debug',
    'suffix': 'universal'
})

uframeworks.append({
    'name': 'Release',
    'frameworks': ['iphoneos', 'iphonesimulator'],
    'base_framework': 'iphoneos',
    'configuration': 'Release',
    'suffix': 'universal'
})

for uframework in uframeworks:
    uframework_folder_name = '{0}-{1}'.format(uframework['configuration'], uframework['suffix'])
    uframework_dir = os.path.join(build_dir, uframework_folder_name)
    base_framework_dir = os.path.join(build_dir, '{0}-{1}'.format(uframework['configuration'], uframework['base_framework']))

    try:
        shutil.rmtree(path=uframework_dir)    
    except:
        pass

    try:
        shutil.copytree(base_framework_dir, uframework_dir)
    except:
        pass

    call_params = ['lipo', '-create']
    call_params.extend(['-output', os.path.join(uframework_dir, 'EzoRed.framework', 'EzoRed')])

    for framework in uframework['frameworks']:
        call_params.extend([os.path.join(build_dir, '{0}-{1}'.format(uframework['configuration'], framework), 'EzoRed.framework', 'EzoRed')])

    check_call(call_params)

print('Universal framework generated')
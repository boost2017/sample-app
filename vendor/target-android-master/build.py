import os
import shutil
from subprocess import call
import shutil

home_dir = os.getenv(key='EZORED_PROJECT_HOME')
current_dir = os.getcwd()
vendor_dir = os.getenv(key='EZORED_TARGET_VENDOR_DIR')
temp_dir = os.getenv(key='EZORED_TARGET_TEMP_DIR')
build_dir = os.getenv(key='EZORED_TARGET_BUILD_DIR')
target_build_dir = os.path.join(vendor_dir, 'build')

call(['./gradlew', 'build'])

try:
    shutil.rmtree(path=build_dir)    
except:
    pass

try:
	os.makedirs(build_dir)
except:
    pass

shutil.copy(os.path.join(vendor_dir, 'library', 'build', 'outputs', 'aar', 'library-debug.aar'), build_dir)
shutil.copy(os.path.join(vendor_dir, 'library', 'build', 'outputs', 'aar', 'library-release.aar'), build_dir)
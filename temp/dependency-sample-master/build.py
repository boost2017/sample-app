import os
import shutil

home_dir = os.getenv(key='EZORED_PROJECT_HOME')
current_dir = os.getcwd()
vendor_dir = os.getenv(key='EZORED_DEPENDENCY_VENDOR_DIR')
temp_dir = os.getenv(key='EZORED_DEPENDENCY_TEMP_DIR')

print('Sample :: Build script')
print('Sample :: EZORED_PROJECT_HOME: {0}'.format(home_dir))
print('Sample :: WORKING_DIR: {0}'.format(current_dir))
print('Sample :: VENDOR_DIR: {0}'.format(vendor_dir))
print('Sample :: TEMP_DIR: {0}'.format(temp_dir))

try:
    shutil.rmtree(path=vendor_dir)
except:
    pass

shutil.copytree(os.path.join(current_dir, 'build'), vendor_dir)
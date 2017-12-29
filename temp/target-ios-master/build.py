import os
import shutil

home_dir = os.getenv(key='EZORED_PROJECT_HOME')
current_dir = os.getcwd()
vendor_dir = os.getenv(key='EZORED_TARGET_VENDOR_DIR')
temp_dir = os.getenv(key='EZORED_TARGET_TEMP_DIR')

try:
    shutil.rmtree(path=vendor_dir)
except:
    pass

shutil.copytree(os.path.join(current_dir, 'build'), vendor_dir)
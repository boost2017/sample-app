import os
import shutil
import subprocess

# remove all old djinni files
try:
    shutil.rmtree(path='build/djinni')
except:
    pass

# generate new files
subprocess.call([
    "/Users/paulo/Developer/workspaces/java/djinni/src/run",
    "--java-out", "build/djinni/java-output",
	"--java-package", "com.ezored.sample",
	"--ident-java-field", "mFooBar",

	"--cpp-out", "build/djinni/cpp-output",
	"--cpp-namespace", "EzoRed::Sample",
	"--ident-cpp-field", "fooBar",
	"--ident-cpp-method", "fooBar",
	
	"--ident-jni-class", "FooBar",
	"--ident-jni-file", "FooBar",
	"--jni-out", "build/djinni/jni-output",

	"--objc-out", "build/djinni/objc-output",
	"--objc-type-prefix", "EZR",
	"--objcpp-out", "build/djinni/objc-output",

	"--idl", "djinni/proj.djinni"	
])
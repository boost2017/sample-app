# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.EzoRed.Debug:
/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/Debug${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed:
	/bin/rm -f /Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/Debug${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed


PostBuild.EzoRed.Release:
/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/Release${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed:
	/bin/rm -f /Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/Release${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed


PostBuild.EzoRed.MinSizeRel:
/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/MinSizeRel${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed:
	/bin/rm -f /Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/MinSizeRel${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed


PostBuild.EzoRed.RelWithDebInfo:
/Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/RelWithDebInfo${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed:
	/bin/rm -f /Users/paulo/Developer/workspaces/cpp/ezored-sample-app/vendor/target-ios-master/build/RelWithDebInfo${EFFECTIVE_PLATFORM_NAME}/EzoRed.framework/EzoRed




# For each target create a dummy ruleso the target does not have to exist

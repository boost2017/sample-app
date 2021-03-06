// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#import "EZRAudioStreamerBridge+Private.h"
#import "EZRAudioStreamerBridge.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#import "EZRAudioStreamerPlatformService+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface EZRAudioStreamerBridge ()

- (id)initWithCpp:(const std::shared_ptr<::EzoRed::Media::AudioStreamerBridge>&)cppRef;

@end

@implementation EZRAudioStreamerBridge {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::EzoRed::Media::AudioStreamerBridge>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::EzoRed::Media::AudioStreamerBridge>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

+ (nullable EZRAudioStreamerBridge *)sharedInstance {
    try {
        auto objcpp_result_ = ::EzoRed::Media::AudioStreamerBridge::sharedInstance();
        return ::djinni_generated::AudioStreamerBridge::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)setPlatformService:(nullable id<EZRAudioStreamerPlatformService>)ps {
    try {
        _cppRefHandle.get()->setPlatformService(::djinni_generated::AudioStreamerPlatformService::toCpp(ps));
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nullable id<EZRAudioStreamerPlatformService>)getPlatformService {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getPlatformService();
        return ::djinni_generated::AudioStreamerPlatformService::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSString *)getUrl {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getUrl();
        return ::djinni::String::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)setUrl:(nonnull NSString *)url {
    try {
        _cppRefHandle.get()->setUrl(::djinni::String::toCpp(url));
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (BOOL)isPlaying {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->isPlaying();
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)play {
    try {
        _cppRefHandle.get()->play();
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)pause {
    try {
        _cppRefHandle.get()->pause();
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto AudioStreamerBridge::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto AudioStreamerBridge::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<EZRAudioStreamerBridge>(cpp);
}

}  // namespace djinni_generated

@end

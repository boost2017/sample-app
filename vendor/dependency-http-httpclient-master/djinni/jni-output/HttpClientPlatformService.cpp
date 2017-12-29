// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#include "HttpClientPlatformService.hpp"  // my header
#include "HttpResponse.hpp"
#include "Marshal.hpp"

namespace djinni_generated {

HttpClientPlatformService::HttpClientPlatformService() : ::djinni::JniInterface<::EzoRed::Http::HttpClientPlatformService, HttpClientPlatformService>() {}

HttpClientPlatformService::~HttpClientPlatformService() = default;

HttpClientPlatformService::JavaProxy::JavaProxy(JniType j) : Handle(::djinni::jniGetThreadEnv(), j) { }

HttpClientPlatformService::JavaProxy::~JavaProxy() = default;

::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doGet(const std::string & c_url) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doGet,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}
::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doHead(const std::string & c_url) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doHead,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}
::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doPost(const std::string & c_url, const std::string & c_data, const std::string & c_content_type) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doPost,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_data)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_content_type)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}
::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doPut(const std::string & c_url, const std::string & c_data, const std::string & c_content_type) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doPut,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_data)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_content_type)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}
::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doDelete(const std::string & c_url, const std::string & c_data, const std::string & c_content_type) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doDelete,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_data)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_content_type)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}
::EzoRed::Http::HttpResponse HttpClientPlatformService::JavaProxy::doPatch(const std::string & c_url, const std::string & c_data, const std::string & c_content_type) {
    auto jniEnv = ::djinni::jniGetThreadEnv();
    ::djinni::JniLocalScope jscope(jniEnv, 10);
    const auto& data = ::djinni::JniClass<::djinni_generated::HttpClientPlatformService>::get();
    auto jret = jniEnv->CallObjectMethod(Handle::get().get(), data.method_doPatch,
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_url)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_data)),
                                         ::djinni::get(::djinni::String::fromCpp(jniEnv, c_content_type)));
    ::djinni::jniExceptionCheck(jniEnv);
    return ::djinni_generated::HttpResponse::toCpp(jniEnv, jret);
}

}  // namespace djinni_generated

// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include "djinni_support.hpp"
#include "http_client_bridge.hpp"

namespace djinni_generated {

class HttpClientBridge final : ::djinni::JniInterface<::EzoRed::Http::HttpClientBridge, HttpClientBridge> {
public:
    using CppType = std::shared_ptr<::EzoRed::Http::HttpClientBridge>;
    using CppOptType = std::shared_ptr<::EzoRed::Http::HttpClientBridge>;
    using JniType = jobject;

    using Boxed = HttpClientBridge;

    ~HttpClientBridge();

    static CppType toCpp(JNIEnv* jniEnv, JniType j) { return ::djinni::JniClass<HttpClientBridge>::get()._fromJava(jniEnv, j); }
    static ::djinni::LocalRef<JniType> fromCppOpt(JNIEnv* jniEnv, const CppOptType& c) { return {jniEnv, ::djinni::JniClass<HttpClientBridge>::get()._toJava(jniEnv, c)}; }
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c) { return fromCppOpt(jniEnv, c); }

private:
    HttpClientBridge();
    friend ::djinni::JniClass<HttpClientBridge>;
    friend ::djinni::JniInterface<::EzoRed::Http::HttpClientBridge, HttpClientBridge>;

};

}  // namespace djinni_generated
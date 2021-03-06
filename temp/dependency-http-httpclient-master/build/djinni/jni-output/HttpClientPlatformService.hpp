// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include "djinni_support.hpp"
#include "http_client_platform_service.hpp"

namespace djinni_generated {

class HttpClientPlatformService final : ::djinni::JniInterface<::EzoRed::Http::HttpClientPlatformService, HttpClientPlatformService> {
public:
    using CppType = std::shared_ptr<::EzoRed::Http::HttpClientPlatformService>;
    using CppOptType = std::shared_ptr<::EzoRed::Http::HttpClientPlatformService>;
    using JniType = jobject;

    using Boxed = HttpClientPlatformService;

    ~HttpClientPlatformService();

    static CppType toCpp(JNIEnv* jniEnv, JniType j) { return ::djinni::JniClass<HttpClientPlatformService>::get()._fromJava(jniEnv, j); }
    static ::djinni::LocalRef<JniType> fromCppOpt(JNIEnv* jniEnv, const CppOptType& c) { return {jniEnv, ::djinni::JniClass<HttpClientPlatformService>::get()._toJava(jniEnv, c)}; }
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c) { return fromCppOpt(jniEnv, c); }

private:
    HttpClientPlatformService();
    friend ::djinni::JniClass<HttpClientPlatformService>;
    friend ::djinni::JniInterface<::EzoRed::Http::HttpClientPlatformService, HttpClientPlatformService>;

    class JavaProxy final : ::djinni::JavaProxyHandle<JavaProxy>, public ::EzoRed::Http::HttpClientPlatformService
    {
    public:
        JavaProxy(JniType j);
        ~JavaProxy();

        ::EzoRed::Http::HttpResponse doGet(const std::string & url) override;
        ::EzoRed::Http::HttpResponse doHead(const std::string & url) override;
        ::EzoRed::Http::HttpResponse doPost(const std::string & url, const std::string & data, const std::string & content_type) override;
        ::EzoRed::Http::HttpResponse doPut(const std::string & url, const std::string & data, const std::string & content_type) override;
        ::EzoRed::Http::HttpResponse doDelete(const std::string & url, const std::string & data, const std::string & content_type) override;
        ::EzoRed::Http::HttpResponse doPatch(const std::string & url, const std::string & data, const std::string & content_type) override;

    private:
        friend ::djinni::JniInterface<::EzoRed::Http::HttpClientPlatformService, ::djinni_generated::HttpClientPlatformService>;
    };

    const ::djinni::GlobalRef<jclass> clazz { ::djinni::jniFindClass("com/ezored/http/HttpClientPlatformService") };
    const jmethodID method_doGet { ::djinni::jniGetMethodID(clazz.get(), "doGet", "(Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
    const jmethodID method_doHead { ::djinni::jniGetMethodID(clazz.get(), "doHead", "(Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
    const jmethodID method_doPost { ::djinni::jniGetMethodID(clazz.get(), "doPost", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
    const jmethodID method_doPut { ::djinni::jniGetMethodID(clazz.get(), "doPut", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
    const jmethodID method_doDelete { ::djinni::jniGetMethodID(clazz.get(), "doDelete", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
    const jmethodID method_doPatch { ::djinni::jniGetMethodID(clazz.get(), "doPatch", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ezored/http/HttpResponse;") };
};

}  // namespace djinni_generated

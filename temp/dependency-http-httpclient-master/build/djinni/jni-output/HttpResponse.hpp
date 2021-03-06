// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include "djinni_support.hpp"
#include "http_response.hpp"

namespace djinni_generated {

class HttpResponse final {
public:
    using CppType = ::EzoRed::Http::HttpResponse;
    using JniType = jobject;

    using Boxed = HttpResponse;

    ~HttpResponse();

    static CppType toCpp(JNIEnv* jniEnv, JniType j);
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c);

private:
    HttpResponse();
    friend ::djinni::JniClass<HttpResponse>;

    const ::djinni::GlobalRef<jclass> clazz { ::djinni::jniFindClass("com/ezored/http/HttpResponse") };
    const jmethodID jconstructor { ::djinni::jniGetMethodID(clazz.get(), "<init>", "(ILjava/lang/String;)V") };
    const jfieldID field_mCode { ::djinni::jniGetFieldID(clazz.get(), "mCode", "I") };
    const jfieldID field_mBody { ::djinni::jniGetFieldID(clazz.get(), "mBody", "Ljava/lang/String;") };
};

}  // namespace djinni_generated

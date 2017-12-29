// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#include "HttpResponse.hpp"  // my header
#include "Marshal.hpp"

namespace djinni_generated {

HttpResponse::HttpResponse() = default;

HttpResponse::~HttpResponse() = default;

auto HttpResponse::fromCpp(JNIEnv* jniEnv, const CppType& c) -> ::djinni::LocalRef<JniType> {
    const auto& data = ::djinni::JniClass<HttpResponse>::get();
    auto r = ::djinni::LocalRef<JniType>{jniEnv->NewObject(data.clazz.get(), data.jconstructor,
                                                           ::djinni::get(::djinni::I32::fromCpp(jniEnv, c.code)),
                                                           ::djinni::get(::djinni::String::fromCpp(jniEnv, c.body)))};
    ::djinni::jniExceptionCheck(jniEnv);
    return r;
}

auto HttpResponse::toCpp(JNIEnv* jniEnv, JniType j) -> CppType {
    ::djinni::JniLocalScope jscope(jniEnv, 3);
    assert(j != nullptr);
    const auto& data = ::djinni::JniClass<HttpResponse>::get();
    return {::djinni::I32::toCpp(jniEnv, jniEnv->GetIntField(j, data.field_mCode)),
            ::djinni::String::toCpp(jniEnv, (jstring)jniEnv->GetObjectField(j, data.field_mBody))};
}

}  // namespace djinni_generated
// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include "djinni_support.hpp"
#include "greeting_message_platform_service.hpp"

namespace djinni_generated {

class GreetingMessagePlatformService final : ::djinni::JniInterface<::EzoRed::Sample::GreetingMessagePlatformService, GreetingMessagePlatformService> {
public:
    using CppType = std::shared_ptr<::EzoRed::Sample::GreetingMessagePlatformService>;
    using CppOptType = std::shared_ptr<::EzoRed::Sample::GreetingMessagePlatformService>;
    using JniType = jobject;

    using Boxed = GreetingMessagePlatformService;

    ~GreetingMessagePlatformService();

    static CppType toCpp(JNIEnv* jniEnv, JniType j) { return ::djinni::JniClass<GreetingMessagePlatformService>::get()._fromJava(jniEnv, j); }
    static ::djinni::LocalRef<JniType> fromCppOpt(JNIEnv* jniEnv, const CppOptType& c) { return {jniEnv, ::djinni::JniClass<GreetingMessagePlatformService>::get()._toJava(jniEnv, c)}; }
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c) { return fromCppOpt(jniEnv, c); }

private:
    GreetingMessagePlatformService();
    friend ::djinni::JniClass<GreetingMessagePlatformService>;
    friend ::djinni::JniInterface<::EzoRed::Sample::GreetingMessagePlatformService, GreetingMessagePlatformService>;

    class JavaProxy final : ::djinni::JavaProxyHandle<JavaProxy>, public ::EzoRed::Sample::GreetingMessagePlatformService
    {
    public:
        JavaProxy(JniType j);
        ~JavaProxy();

        void showGreetingMessageAlert(const std::string & title, const std::string & message) override;

    private:
        friend ::djinni::JniInterface<::EzoRed::Sample::GreetingMessagePlatformService, ::djinni_generated::GreetingMessagePlatformService>;
    };

    const ::djinni::GlobalRef<jclass> clazz { ::djinni::jniFindClass("com/ezored/sample/GreetingMessagePlatformService") };
    const jmethodID method_showGreetingMessageAlert { ::djinni::jniGetMethodID(clazz.get(), "showGreetingMessageAlert", "(Ljava/lang/String;Ljava/lang/String;)V") };
};

}  // namespace djinni_generated

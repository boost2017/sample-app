// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#pragma once

#include "audio_streamer_bridge.hpp"
#include "djinni_support.hpp"

namespace djinni_generated {

class AudioStreamerBridge final : ::djinni::JniInterface<::EzoRed::Media::AudioStreamerBridge, AudioStreamerBridge> {
public:
    using CppType = std::shared_ptr<::EzoRed::Media::AudioStreamerBridge>;
    using CppOptType = std::shared_ptr<::EzoRed::Media::AudioStreamerBridge>;
    using JniType = jobject;

    using Boxed = AudioStreamerBridge;

    ~AudioStreamerBridge();

    static CppType toCpp(JNIEnv* jniEnv, JniType j) { return ::djinni::JniClass<AudioStreamerBridge>::get()._fromJava(jniEnv, j); }
    static ::djinni::LocalRef<JniType> fromCppOpt(JNIEnv* jniEnv, const CppOptType& c) { return {jniEnv, ::djinni::JniClass<AudioStreamerBridge>::get()._toJava(jniEnv, c)}; }
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c) { return fromCppOpt(jniEnv, c); }

private:
    AudioStreamerBridge();
    friend ::djinni::JniClass<AudioStreamerBridge>;
    friend ::djinni::JniInterface<::EzoRed::Media::AudioStreamerBridge, AudioStreamerBridge>;

};

}  // namespace djinni_generated
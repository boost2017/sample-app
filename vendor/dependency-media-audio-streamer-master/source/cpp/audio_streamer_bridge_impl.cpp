#include "audio_streamer_bridge_impl.hpp"

namespace EzoRed { namespace Media {

std::shared_ptr<AudioStreamerBridgeImpl> AudioStreamerBridgeImpl::instance = nullptr;

AudioStreamerBridgeImpl::AudioStreamerBridgeImpl() {
    ps = nullptr;
}

std::shared_ptr<AudioStreamerBridge> AudioStreamerBridge::sharedInstance() {
    return AudioStreamerBridgeImpl::internalSharedInstance();
}

std::shared_ptr<AudioStreamerBridgeImpl> AudioStreamerBridgeImpl::internalSharedInstance() {
    if (instance == nullptr) {
        instance = std::make_shared<AudioStreamerBridgeImpl>();
    }
    
    return instance;
}

void AudioStreamerBridgeImpl::setPlatformService(const std::shared_ptr<AudioStreamerPlatformService> & ps) {
    this->ps = ps;
}

std::shared_ptr<AudioStreamerPlatformService> AudioStreamerBridgeImpl::getPlatformService() {
    return this->ps;
}

std::string AudioStreamerBridgeImpl::getUrl() {
    if (ps == nullptr) {
        return nullptr;
    }
    
    return ps->getUrl();
}

void AudioStreamerBridgeImpl::setUrl(const std::string & url) {
    if (ps != nullptr) {
        ps->setUrl(url);
    }
}

bool AudioStreamerBridgeImpl::isPlaying() {
    if (ps != nullptr) {
        return ps->isPlaying();
    }
    
    return false;
}

void AudioStreamerBridgeImpl::play() {
    if (ps != nullptr) {
        ps->play();
    }
}

void AudioStreamerBridgeImpl::pause() {
    if (ps != nullptr) {
        ps->pause();
    }
}

}}

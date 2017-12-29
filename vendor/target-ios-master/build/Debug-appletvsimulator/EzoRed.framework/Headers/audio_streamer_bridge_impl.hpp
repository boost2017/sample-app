#pragma once

#include "audio_streamer_bridge.hpp"
#include "audio_streamer_platform_service.hpp"

namespace EzoRed { namespace Media {
    
class AudioStreamerBridgeImpl : public AudioStreamerBridge {

public:
    AudioStreamerBridgeImpl();
    
    static std::shared_ptr<AudioStreamerBridge> sharedInstance();
    static std::shared_ptr<AudioStreamerBridgeImpl> internalSharedInstance();

    void setPlatformService(const std::shared_ptr<AudioStreamerPlatformService> & ps) override;
    std::shared_ptr<AudioStreamerPlatformService> getPlatformService() override;
    std::string getUrl() override;
    void setUrl(const std::string &url) override;
    bool isPlaying() override;
    void play() override;
    void pause() override;

private:
    static std::shared_ptr<AudioStreamerBridgeImpl> instance;
    std::shared_ptr<AudioStreamerPlatformService> ps;
    
};
    
}}

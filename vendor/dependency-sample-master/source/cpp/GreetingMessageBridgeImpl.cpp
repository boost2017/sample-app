#include "GreetingMessageBridgeImpl.hpp"

namespace EzoRed { namespace Sample {
    
std::shared_ptr<GreetingMessageBridgeImpl> GreetingMessageBridgeImpl::instance = nullptr;

GreetingMessageBridgeImpl::GreetingMessageBridgeImpl() {
    this->ps = nullptr;
    this->gm = nullptr;
}

std::shared_ptr<GreetingMessageBridge> GreetingMessageBridge::sharedInstance() {
    return GreetingMessageBridgeImpl::internalSharedInstance();
}

std::shared_ptr<GreetingMessageBridgeImpl> GreetingMessageBridgeImpl::internalSharedInstance() {
    if (instance == nullptr) {
        auto gm = std::make_shared<GreetingMessage>();
        
        instance = std::make_shared<GreetingMessageBridgeImpl>();
        instance->setGM(gm);
    }
    
    return instance;
}

void GreetingMessageBridgeImpl::setMessage(const std::string & message) {
    gm->setMessage(message);
}

std::string GreetingMessageBridgeImpl::getMessage() {
    return gm->getMessage();
}

void GreetingMessageBridgeImpl::printMessage() {
    gm->printMessage();
}

void GreetingMessageBridgeImpl::showGreetingMessageAlert(const std::string & title, const std::string & message) {
    if (ps != nullptr) {
        ps->showGreetingMessageAlert(title, message);
    }
}

void GreetingMessageBridgeImpl::setGM(const std::shared_ptr<GreetingMessage> & gm) {
    this->gm = gm;
}
    
void GreetingMessageBridgeImpl::setPlatformService(const std::shared_ptr<GreetingMessagePlatformService> & ps) {
    this->ps = ps;
}
    
}}

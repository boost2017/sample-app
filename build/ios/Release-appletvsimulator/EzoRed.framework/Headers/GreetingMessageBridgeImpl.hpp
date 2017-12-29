#pragma once

#include <string>
#include <iostream>
#include <greeting_message_bridge.hpp>
#include <greeting_message_platform_service.hpp>
#include <ezored/sample/GreetingMessage.hpp>

namespace EzoRed { namespace Sample {
	
class GreetingMessageBridgeImpl : public GreetingMessageBridge
{
public:
	GreetingMessageBridgeImpl();

	static std::shared_ptr<GreetingMessageBridge> sharedInstance();
    static std::shared_ptr<GreetingMessageBridgeImpl> internalSharedInstance();

	void setMessage(const std::string & message) override;
	std::string getMessage() override;
	void printMessage() override;
	void showGreetingMessageAlert(const std::string & title, const std::string & message) override;
	void setGM(const std::shared_ptr<GreetingMessage> & gm);
    void setPlatformService(const std::shared_ptr<GreetingMessagePlatformService> & ps) override;

private:
    static std::shared_ptr<GreetingMessageBridgeImpl> instance;

	std::shared_ptr<GreetingMessagePlatformService> ps;
	std::shared_ptr<GreetingMessage> gm;
};

}}

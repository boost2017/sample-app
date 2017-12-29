#include "GreetingMessage.hpp"

EzoRed::Sample::GreetingMessage::GreetingMessage()
{
	std::cout << "GreetingMessage::GreetingMessage" << std::endl;
}

EzoRed::Sample::GreetingMessage::~GreetingMessage()
{
	std::cout << "GreetingMessage::~GreetingMessage" << std::endl;
}

void EzoRed::Sample::GreetingMessage::setMessage(const std::string &message)
{
	this->message = message;
}

std::string EzoRed::Sample::GreetingMessage::getMessage()
{
	return message;
}

void EzoRed::Sample::GreetingMessage::printMessage()
{
	std::cout << "Message: " << message << std::endl;
}
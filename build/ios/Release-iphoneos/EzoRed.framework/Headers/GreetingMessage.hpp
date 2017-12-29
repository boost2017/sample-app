#pragma once

#include <string>
#include <iostream>

namespace EzoRed { namespace Sample {
		
class GreetingMessage
{
public:
	GreetingMessage();
	~GreetingMessage();

	void setMessage(const std::string &message);
	std::string getMessage();
	void printMessage();

private:
	std::string message;
};
	
}}
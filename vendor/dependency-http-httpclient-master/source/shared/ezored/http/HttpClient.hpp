#pragma once

#include <string>
#include <sstream>
#include <curl/curl.h>
#include "http_response.hpp"

namespace EzoRed { namespace Http {
		
class HttpClient
{

public:
	HttpClient();
	~HttpClient();

	void reset();
	
	std::shared_ptr<EzoRed::Http::HttpResponse> doGet(std::string url);
	std::shared_ptr<EzoRed::Http::HttpResponse> doPost(std::string url, std::string data);
	std::shared_ptr<EzoRed::Http::HttpResponse> doPut(std::string url, std::string data);
	std::shared_ptr<EzoRed::Http::HttpResponse> doDelete(std::string url);
	std::shared_ptr<EzoRed::Http::HttpResponse> doHead(std::string url);
	std::shared_ptr<EzoRed::Http::HttpResponse> doPatch(std::string url);

	void setSSLVerifyPeer(bool sslVerifyPeer);
	void setSSLVerifyHost(bool sslVerifyHost);
	void setFollowLocation(bool followLocation);
	void setVerbose(bool verbose);
	void setForbideReuse(bool forbideReuse);
	void setTimeout(int timeout);
	void setUserAgent(std::string userAgent);
	void setCertificateAuthorityPath(std::string caPath);
	void setConnectTimeout(int connectTimeout);
	void setSSLVersion(int sslVersion);
	void setCertificateAuthorityInfo(std::string caInfo);

private:
	CURL *curl;

	std::shared_ptr<EzoRed::Http::HttpResponse> doRequest(std::string url);
	static size_t writeDataCallback(void *contents, size_t size, size_t nmemb, void *userdata);

	bool sslVerifyPeer;
	bool sslVerifyHost;
	bool followLocation;
	bool verbose;
	bool forbideReuse;
	int timeout;
	int connectTimeout;
	int sslVersion;

	std::string caPath;
	std::string userAgent;
	std::string caInfo;

};

}}